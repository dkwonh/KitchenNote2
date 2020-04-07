package custom.Service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import custom.Model.BoardDao;
import custom.controller.BoardDto;
import custom.controller.BoardService;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardDao dao;
	
	@Override
	public void create(BoardDto dto) throws Exception{
		String title = dto.getTitle();
				String content = dto.getContent();
		//String writer = dto.getWriter();
		
		title = title.replace("<", "%lt;");      
		title = title.replace(">", "%gt;");
		//writer = writer.replace("<", "&lt;");
		//writer = writer.replace(">", "&gt;");
		
		title = title.replace(" ", "&nbsp;&nbsp;");
		//writer = writer.replace(" ", "&nbsp;&nbsp;");
		
		content = content.replace("\n", "<br>");
		dto.setTitle(title);
		dto.setContent(content);
		//dto.setWriter(writer);
		dao.create(dto);
	}
	
	@Override
	public BoardDto read(int bno) throws Exception{
		return dao.read(bno);
	}
	@Override
	public void update(BoardDto dto) throws Exception{
		dao.update(dto);
	}
	@Override
	public void delete(int bno) throws Exception{
		dao.delete(bno);
	}
	@Override
	public List<BoardDto> listAll() throws Exception{
		return dao.listAll();
	}
	@Override
	public void increaseViewcnt(int bno,HttpSession session) throws Exception{
		long update_time = 0;
		if(session.getAttribute("update_time_"+bno) != null) {
			update_time = (long)session.getAttribute("update_time"+bno);
		}
		long current_time = System.currentTimeMillis();
		if(current_time - update_time > 5*1000) {
			dao.increaseViewcnt(bno);
			session.setAttribute("update_time_"+bno, current_time);
		}
	}    
}
