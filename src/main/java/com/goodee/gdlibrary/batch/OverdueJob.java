package com.goodee.gdlibrary.batch;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.goodee.gdlibrary.domain.NoticeFileAttachDTO;
import com.goodee.gdlibrary.domain.RentDTO;
import com.goodee.gdlibrary.mapper.BookManageMapper;
import com.goodee.gdlibrary.mapper.NoticeMapper;
import com.goodee.gdlibrary.util.MyFileUtils;


@Component  // 안녕. 난 bean이야.
public class OverdueJob {

	@Autowired
	private BookManageMapper boardManageMapper;
	
	@Autowired
	private NoticeMapper noticeMapper;
	
	/*
		cron expression(크론식)을 이용한 CronScheduler
		
		1. 구성
		    초 분 시 일 월 요일 [년도]
		
		2. 상세
		    1) 초 : 0~59
		    2) 분 : 0~59
		    3) 시 : 0~23
		    4) 일 : 1~31
		    5) 월 : 0~11, JAN, FEB, MAR, APR, MAY, JUN, JUL, AUG, SEP, OCT, NOV, DEC
		    6) 요일 : 1(MON)~7(SUN), MON, TUE, WED, THR, FRI, SAT, SUN
		
		3. 작성방법
		    1) * : 매번
		    2) ? : 설정 안함(일, 요일에서 작성)
		    3) / : 주기
		      a/b : a부터 b마다 동작  0/10
		
		4. 작성예시
		    1) 10초마다             0/10 * * * * ?
		    2) 1분마다              0 0/1 * * * ?
		    3) 5분마다 & 10초 후    10 0/5 * * * ?  (10:00:10, 10:05:10, 10:10:10, ...)
		    4) 수요일 12시마다      0 0 12 ? * 3
		                            0 0 12 ? * WED
		    5) 수요일과 금요일       
		       10:30, 11:30, 12:30  0 30 10-12 ? * WED,FRI
	 */
	
	@Transactional
	@Scheduled(cron="0 30 0 * * ?")  // 크론식(오전 12시30분마다 동작)
	public void execute() {
		
		
		// 연체
		List<RentDTO> res = boardManageMapper.selectRentExpirationDate();
		int saveTotal = 0;
		if(res.isEmpty() == false) {
			for(int i = 0; i < res.size(); i++) {
				saveTotal += boardManageMapper.insertOverdue(res.get(i)); 
			}
			
			if(saveTotal == res.size()) {
				for(int i = 0; i < res.size(); i++) {
					boardManageMapper.deleteRent(res.get(i).getRentNo());					
				}
			}
			
		}
		
		
		// 어제 첨부된 파일 중 잘못된 파일들을 찾아서 제거
		
		// 어제 경로를 알아내기
		String yesterdayPath = MyFileUtils.getYesterdayPath();
		
		// DB에서 가져온 어제 저장된 첨부 파일 목록
		List<NoticeFileAttachDTO> fileAttaches = noticeMapper.selectFileAttachListAtYesterday();
		
		// DB에서 가져온 어제 저장된 첨부 파일들을 Path 객체(경로 + 파일명)로 List에 저장
		List<Path> yesterdayPathes = fileAttaches.stream()
				.map(fileAttach -> Paths.get(yesterdayPath, fileAttach.getNoticeFileAttachSaved()))
				.collect(Collectors.toList());
		
		// 어제 경로 디렉터리에 실제로 저장된 파일들과
		// DB에서 가져온 어제 저장된 첨부 파일 내역을 비교해서 일치하지 않는 파일을 제거
		File dir = new File(yesterdayPath);
		if(dir.exists()) {
			// 어제 경로 디렉터리에 실제로 저장된 파일들 중에서
			// DB에서 가져온 내역과 다른 파일들만 files에 저장(지워야 할 파일들)
			File[] files = dir.listFiles(file -> yesterdayPathes.contains(file.toPath()) == false);
			for(File removeFile : files) {
				removeFile.delete();
			}
		}
		
		
		
		
	}
	
	
	
}
