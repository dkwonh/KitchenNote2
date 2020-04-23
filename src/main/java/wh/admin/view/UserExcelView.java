package wh.admin.view;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import wh.admin.manage.model.MemberDto;

@Component("userToExcel")
public class UserExcelView extends AbstractXlsView{
	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setHeader("Content-Disposition", "attachment; filename=\"user.xls\";");

		Sheet sheet = createFirstSheet(workbook);
		createColumnLabel(sheet);

		List<MemberDto> list = (List<MemberDto>) model.get("userExcel");
		int rowNum = 1;
		for (MemberDto member : list) {
			createPageRankRow(sheet, member, rowNum++);
		}
	}
	
	private Sheet createFirstSheet(Workbook workbook) {
		Sheet sheet = workbook.createSheet();
		workbook.setSheetName(0, "사용자 정보");
		sheet.setColumnWidth(1, 256 * 20);
		return sheet;
	}
	
	private void createColumnLabel(Sheet sheet) {
		Row firstRow = sheet.createRow(0);
		Cell cell = firstRow.createCell(0);
		cell.setCellValue("아이디");

		cell = firstRow.createCell(1);
		cell.setCellValue("비밀번호");

		cell = firstRow.createCell(2);
		cell.setCellValue("닉네임");

		cell = firstRow.createCell(3);
		cell.setCellValue("포크");

		cell = firstRow.createCell(4);
		cell.setCellValue("가입일");

		cell = firstRow.createCell(5);
		cell.setCellValue("등급");
	}

	private void createPageRankRow(Sheet sheet, MemberDto mem, int rowNum) {
		Row row = sheet.createRow(rowNum);

		Cell cell = row.createCell(0);
		cell.setCellValue(mem.getMember_id());

		cell = row.createCell(1);
		cell.setCellValue(mem.getPassword());

		cell = row.createCell(2);
		cell.setCellValue(mem.getNickname());

		cell = row.createCell(3);
		cell.setCellValue(mem.getFork());

		cell = row.createCell(4);
		cell.setCellValue(mem.getJoin_date());

		cell = row.createCell(5);
		cell.setCellValue(mem.getLevel());
	}
}
