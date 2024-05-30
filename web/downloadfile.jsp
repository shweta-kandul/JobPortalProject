<%-- 
    Document   : downloadfile
    Created on : Mar 2, 2024, 4:17:58 PM
    Author     : shwet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="com.itextpdf.text.*"%>
<%@page import="com.itextpdf.text.pdf.*"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Download resume</title>
</head>
<body>
<%
response.setContentType("application/pdf");
response.setHeader("Content-Disposition", "attachment; filename=\"" + request.getParameter("fullname") + "_resume.pdf\"");

try {
    Document document = new Document();
    PdfWriter.getInstance(document, response.getOutputStream());
    document.open();

    Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 16, BaseColor.BLUE);
    Font fieldFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLACK);
    Font valueFont = FontFactory.getFont(FontFactory.HELVETICA, 12, BaseColor.BLACK);

    // Add content to the PDF
    document.add(new Paragraph("Resume Form", titleFont));

    PdfPTable table = new PdfPTable(2);
    table.setWidthPercentage(100);
    table.setSpacingBefore(10f);
    table.setSpacingAfter(10f);

    addCell(table, "Full Name:", request.getParameter("fullname"), fieldFont, valueFont);
    addCell(table, "Email:", request.getParameter("email"), fieldFont, valueFont);
    addCell(table, "Mobile no:", request.getParameter("phoneno"), fieldFont, valueFont);
    addCell(table, "Address:", request.getParameter("address"), fieldFont, valueFont);
    addCell(table, "Professional Links:", request.getParameter("links"), fieldFont, valueFont);
    addCell(table, "Career Objective:", request.getParameter("objective"), fieldFont, valueFont);
    addCell(table, "Academic Qualifications:", request.getParameter("education"), fieldFont, valueFont);
    addCell(table, "Experience:", request.getParameter("experience"), fieldFont, valueFont);
    addCell(table, "Skills:", request.getParameter("skills"), fieldFont, valueFont);
    addCell(table, "Certificates:", request.getParameter("certificates"), fieldFont, valueFont);
    addCell(table, "Projects:", request.getParameter("projects"), fieldFont, valueFont);

    document.add(table);

    document.close();
} catch (DocumentException e) {
    e.printStackTrace();
}

%>
<%!
private static void addCell(PdfPTable table, String field, String value, Font fieldFont, Font valueFont) {
    PdfPCell fieldCell = new PdfPCell(new Phrase(field, fieldFont));
    fieldCell.setBorder(Rectangle.LEFT | Rectangle.TOP | Rectangle.BOTTOM);
    fieldCell.setPadding(5f);
    fieldCell.setPaddingLeft(10f);
    PdfPCell valueCell = new PdfPCell(new Phrase(value, valueFont));
    valueCell.setBorder(Rectangle.RIGHT | Rectangle.TOP | Rectangle.BOTTOM);
    valueCell.setPadding(5f);
    valueCell.setPaddingLeft(10f);
    table.addCell(fieldCell);
    table.addCell(valueCell);
}
%>
</body>
</html>
