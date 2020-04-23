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

@Component("chefToExcel")
public class ChefExcelView extends AbstractXlsView{

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setHeader("Content-Disposition", "attachment; filename=\"chef.xls\";");

		Sheet sheet = createFirstSheet(workbook);
		createColumnLabel(sheet);

		List<ChefDto> list = (List<ChefDto>) model.get("chefExcel");
		int rowNum = 1;
		for (ChefDto chef : list) {
			createPageRankRow(sheet, chef, rowNum++);
		}
		
	}
	private Sheet createFirstSheet(Workbook workbook) {
		Sheet sheet = workbook.createSheet();
		workbook.setSheetName(0, "셰프 정보");
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
		
		cell = firstRow.createCell(6);
		cell.setCellValue("SNS");
		
		cell = firstRow.createCell(7);
		cell.setCellValue("연락처");
		
		cell = firstRow.createCell(8);
		cell.setCellValue("등업일");
		
	}

	private void createPageRankRow(Sheet sheet, ChefDto mem, int rowNum) {
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
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String time = sdf.format(mem.getJoin_date());
		cell.setCellValue(time);

		cell = row.createCell(5);
		cell.setCellValue(mem.getLevel());
		
		cell = row.createCell(6);
		cell.setCellValue(mem.getSns_address());
		
		cell = row.createCell(7);
		cell.setCellValue(mem.getTel());
		
		cell = row.createCell(8);
		time = sdf.format(mem.getDate());
		cell.setCellValue(time);
	}
}
