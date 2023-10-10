package org.academy.service;

import java.util.List;

import org.academy.domain.Criteria;
import org.academy.domain.InqueryVO;
import org.academy.mapper.InqueryMapper;
import org.academy.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Log4j
@AllArgsConstructor
@Service
public class InqueryServicelmpl implements InqueryService {
	
	@Setter(onMethod_ = @Autowired)
	private InqueryMapper mapper;
	
	@Override
	public InqueryVO get(String oi_code) {
		// TODO Auto-generated method stub
		log.info("get...................");
		
		return mapper.read(oi_code);
	}
	/*
	@Override
	public List<InqueryVO> getList() {
		log.info("getList...................");
		
		return mapper.getList();
	}*/

	   @Override
	   public List<InqueryVO> getList(Criteria cri) {
	      
	      log.info("get List with criteria: " +cri);
	      
	      return mapper.getListWithPaging(cri);
	   }
	   
	   
	   @Override
	   public int getTotal(Criteria cri) {
	      
	      log.info("get total count");
	      
	      return mapper.getTotalCount(cri);
	   }
	   
	   @Override
		public boolean remove(String oi_code) {
			// TODO Auto-generated method stub
			log.info("remove..................." + oi_code);
			
			return mapper.delete(oi_code) == 1;
		}

}
