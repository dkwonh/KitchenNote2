package custom.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import custom.Model.BoardDao;
import custom.controller.BoardDto;
import custom.controller.BoardService;
/*import custom.controller.Criteria;*/

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao dao;

	@Override
	public void create(BoardDto dto) throws Exception {
		/*
		 * String title = dto.getTitle(); String content = dto.getContent(); String
		 * writer = dto.getWriter();
		 * 
		 * title = title.replace("<", "%lt;"); title = title.replace(">", "%gt;");
		 * writer = writer.replace("<", "&lt;"); writer = writer.replace(">", "&gt;");
		 * 
		 * title = title.replace(" ", "&nbsp;&nbsp;"); writer = writer.replace(" ",
		 * "&nbsp;&nbsp;");
		 * 
		 * content = content.replace("\n", "<br>"); dto.setTitle(title);
		 * dto.setContent(content); dto.setWriter(writer);
		 */
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String to = sdf.format(date);
		dto.setRegdate(date);
		dao.create(dto);
	}

	@Override
	public BoardDto read(int bno) throws Exception {
		BoardDto dto = dao.read(bno);
		return dto;
	}

	@Override
	public void update(BoardDto dto) throws Exception {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String to = sdf.format(date);
		dto.setRegdate(date);
		dao.update(dto);
	}

	@Override
	public void delete(int bno) throws Exception {
		dao.delete(bno);
	}

	@Override
	public List<BoardDto> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public void increaseViewcnt(int bno, HttpSession session) throws Exception {
		dao.increaseViewcnt(bno);

	}
	/*
	 * @Override public List<Map<String,Object>> pageList(Criteria cri) throws
	 * Exception{ return dao.pageList(cri); }
	 * 
	 * @Override public int countBoardList() throws Exception {
	 * 
	 * return dao.countBoardList(); }
	 */
}
