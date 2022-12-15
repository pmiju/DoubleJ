<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>게시물관리 - 게시물등록</title>
<link rel="stylesheet" type="text/css" href="../css/post.css">
</head>

<body>
<jsp:include page="post_top.jsp"/>
   <table id="pdupload">
   <tr> 
   <td>
      <form action="post_run.jsp?flag=insert" method="post" enctype="multipart/form-data">
      <table width="100%" align="center" bgcolor="white" border=1>
      <tr>
      <td style="width:150px; text-align:center">카테고리</td>
      <td>
      	<select name="category">
      		<option>선택하시오</option>
      		<option value="man">man</option>
      		<option value="woman">woman</option>
      	</select>
      </td>
      </tr>
      <tr> 
      <td align="center">상품명</td>
      <td align="left"><input type="text" name="name" size="20"></td>
      </tr>
      <tr> 
      <td align="center">상품가격</td>
      <td align="left"><input type="text" name="price" size="20">원</td>
      </tr>
      <tr> 
      <td align="center">상품설명</td>
      <td><textarea rows="10" cols="45" name="detail"></textarea></td>
      </tr>
      <tr> 
      <td align="center">상품수량</td>
      <td><input type="text" name="stock" size="10">개</td>
      </tr>
      <tr> 
      <td align="center">상품이미지</td>
      <td><input type="file" name="image"></td>
      </tr>
      <tr> 
      <td colspan="2" align="center"> 
      <input type="submit" value="상품등록">
      </td>
      </tr>
      </table>
      </form>
   
   </td>
   </tr>
   
   </table>

</body>
</html>
