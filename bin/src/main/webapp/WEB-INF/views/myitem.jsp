<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<body>
<h1>���� ������ ������ ���� �����Ȳ��?</h1>
<c:forEach var="list" items="${list}">
<h2>��ǰ��ȣ${list.orderNo}�� ${list.orderStatus} ���� �Դϴ�.</h2>
�ش���ǰ �����ȣ��${list.deliveryNum}�Դϴ�.
</c:forEach>
</body>