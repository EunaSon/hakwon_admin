package org.academy.mapper;

import java.util.List;

import org.academy.domain.Criteria;
import org.academy.domain.InqueryVO;

public interface InqueryMapper {

		//@Select("select * from online_inquery where oi_code > 0")
		
		// 게시물 불러오기 
		public List<InqueryVO> getList();
		
		public InqueryVO read(String oi_code);
		
		   // 페이징 처리
		public List<InqueryVO> getListWithPaging(Criteria cri);
		   
		public int getTotalCount(Criteria cri);
		
		//delete
		public int delete(String oi_code);
}
