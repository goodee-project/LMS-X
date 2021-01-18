package gd.fintech.lms;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.task.TaskSchedulerBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.stereotype.Component;

import gd.fintech.lms.service.LoginService;

@EnableScheduling
@Component
public class Scheduler {
	@Autowired LoginService loginService;
	
	@Bean
	public ThreadPoolTaskScheduler taskScheduler(TaskSchedulerBuilder builder) {
	    return builder.build();
	}
	// Logger 사용
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 휴면 계정 처리
	@Scheduled(cron = "0 0 0 1 1/1 ?")
	public void dormant() {
		loginService.updateDormantAccount();
		
		// [Logger] 6개월 이상 로그인 하지 않은 계정에 대해 휴면계정 전환
		logger.trace("6개월 이상 로그인 하지 않은 계정에 대해 휴면계정 전환");
	}
}