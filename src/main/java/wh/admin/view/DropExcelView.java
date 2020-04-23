package wh.admin.view;

import java.text.SimpleDateFormat;
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

import wh.admin.manage.model.ChefDto;
import wh.admin.manage.model.DropMembersDto;

@Component("dropToExcel")
public class DropExcelView extends AbstractXlsView{

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setHeader("Content-Disposition", "attachment; filename=\"drop.xls\";");

		Sheet sheet = createFirstSheet(workbook);
		createColumnLabel(sheet);

		List<DropMembersDto> list = (List<DropMembersDto>) model.get("dropExcel");
		int rowNum = 1;
		for (DropMembersDto drop : list) {
			createPageRankRow(sheet, drop, rowNum++);
		}
		
	}
	private Sheet createFirstSheet(Workbook workbook) {
		Sheet sheet = workbook.createSheet();
		workbook.setSheetName(0, "탈퇴자 정보");
		sheet.setColumnWidth(1, 256 * 20);
		return sheet;
	}
	
	private void createColumnLabel(Sheet sheet) {
		Row firstRow = sheet.createRow(0);
		
		Cell cell = firstRow.createCell(0);
		cell.setCellValue("아이디");

		cell = firstRow.createCell(1);
		cell.setCellValue("닉네임");

		cell = firstRow.createCell(2);
		cell.setCellValue("탈퇴일");
		
	}

	private void createPageRankRow(Sheet sheet, DropMembersDto mem, int rowNum) {
		Row row = sheet.createRow(rowNum);

		Cell cell = row.createCell(0);
		cell.setCellValue(mem.getMember_id());
		
		cell = row.createCell(1);
		cell.setCellValue(mem.getNickname());

		cell = row.createCell(2);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String time = sdf.format(mem.getDrop_date());
		cell.setCellValue(time);


	}
}
