<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

  
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查询用户操作</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <jsp:useBean id="computer" class="entity.Computer" scope="request">
  	<%
  		String name = request.getParameter("temp");
  		System.out.println("name" + name);
  		List<String> paths = new ArrayList<String>();
  		
  		 File file ;
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
   ServletContext context = pageContext.getServletContext();
   String filePath = "E:\\MyWorks\\Lenovo\\WebRoot\\upload\\";

   // 验证上传内容了类型
   String contentType = request.getContentType();
   if ((contentType.indexOf("multipart/form-data") >= 0)) {

      DiskFileItemFactory factory = new DiskFileItemFactory();
      // 设置内存中存储文件的最大值
      factory.setSizeThreshold(maxMemSize);
      // 本地存储的数据大于 maxMemSize.
      factory.setRepository(new File("c:\\temp"));

      //创建一个新的文件上传处理程序
      ServletFileUpload upload = new ServletFileUpload(factory);
      //设置最大上传的文件大小
      upload.setSizeMax( maxFileSize );
      try{ 
         // 解析获取的文件
         List fileItems = upload.parseRequest(request);

         //处理上传的文件
         Iterator i = fileItems.iterator();

         out.println("<html>");
         out.println("<head>");
         out.println("<title>JSP File upload</title>");  
         out.println("</head>");
         out.println("<body>");
         while ( i.hasNext () ) 
         {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () )	
            {
            // 获取上传文件的参数
            String fieldName = fi.getFieldName();
            String fileName = fi.getName();
            boolean isInMemory = fi.isInMemory();
            long sizeInBytes = fi.getSize();
            // 写入文件
            if( fileName.lastIndexOf("\\") >= 0 ){
            file = new File( filePath , 
            fileName.substring( fileName.lastIndexOf("\\"))) ;
            }else{
            file = new File( filePath ,
            fileName.substring(fileName.lastIndexOf("\\")+1)) ;
            }
            fi.write( file ) ;
            //images/ba1.jpg
            paths.add("upload/"+fileName);
            out.println("Uploaded Filename: " + filePath + 
            fileName + "<br>");
            }
         }
         out.println("</body>");
         out.println("</html>");
      }catch(Exception ex) {
         System.out.println(ex);
      }
   }else{
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Servlet upload</title>");  
      out.println("</head>");
      out.println("<body>");
      out.println("<p>No file uploaded</p>"); 
      out.println("</body>");
      out.println("</html>");
   }
   
   //computer.uploadComputerImages(name, paths);
   response.sendRedirect("admin.jsp");
  	 %>
  </jsp:useBean>
  </body>
</html>