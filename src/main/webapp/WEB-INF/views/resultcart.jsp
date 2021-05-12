<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/bootstrap-theme.min.css">
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
</head>
	<div class="container">
            <form method="post" action="order.do" onSubmit="return RequiredBox(this)">
            <c:choose>
                <c:when test="${!empty userInfo.id}">
                    <h3>${userInfo.name}���� ��ٱ����Դϴ�.</h3>
                    <input type="hidden" value="shop_db.customer_cart" name="table">
                </c:when>
                <c:when test="${empty userInfo.id}">
                    <h3>��ȸ������ ��ٱ����Դϴ�.</h3>
                    <input type="hidden" value="shop_db.noncustomer_cart" name="table">
                </c:when>
            </c:choose>

            <!-- <div class="table-responsive"> -->
                <table class="table">
                    <thead>
                        <tr class="">
                            <th><input type="checkbox" id="checkall"><label for="checkall">��ü����</label></th>
                            <th class="text-center">��ǰ����</th>
                            <th class="text-center">��ǰ�̸�</th>
                            <th class="text-center">������</th>
                            <th class="text-center">����</th>
                            <th class="text-center">����</th>
                            <th class="text-center">����</th>
                            <th class="text-center">����</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${!empty list}">
                                <c:forEach items="${list}" var="list">
                                    <tr>
                                        <td><input type="checkbox" name="box" class="checkSelect" id="checkSelect" value="${list.idx}"></td>
                                        <td class="text-center"><img src="resources/images/close/${list.prodCode}.jpg" width="120px" height="110px"></td>
                                        <td class="text-center"> ${list.prodName}</td>
                                        <td class="text-center">${list.size}</td>
                                        <td class="text-center">${list.color}</td>
                                        <td class="text-center">${list.count}</td>
                                        <td class="text-center"><fmt:formatNumber value="${list.price}" pattern="#,###" /></td>
                                        <td class="text-center"><input type="button"
                                            onclick="location.href='delcart.do?idx=${list.idx}'" value="x"></td>
                                    </tr>
                                </c:forEach>
                            </c:when>

                            <c:when test="${empty list}">
                                <td></td>
                                <td></td>
                                <td></td>
                                <td class="text-center">��ٱ��ϰ� ������!</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <!-- �ð���������; -->
                            </c:when>
                            <c:otherwise>
                                <p>������ �߻��߾��, �ٽ� ������� �ֽðھ��?</p>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            <!-- </div> -->

            <div class="row">
                <div class="col">
                    <input type="submit" class="btn btn-warning btn-lg" value="�����ϱ�">
                    <button type="submit" class="btn btn-light btn-lg" onclick="location.href = 'index.do'">Ȩ����</button>
                </div>
            </div>
          </form>
        </div>

	<script>
	
	/* �� �ִ� ��� */
function check() {

	let arr = [];
	$('.checkSelect').each(function(i, e) {
	if ($(e).is(':checked')) {
		arr.push($(e).val());
		}
	});

	console.log("��� : " + arr);
	console.log("��� : " + $('checkSelect'));
	console.log("��� 1 :", arr);
	console.log("��� 2 :", $('checkSelect'));

	return false;
	}
	/* üũ��� */
	$(document).ready(function(){
    //�ֻ�� üũ�ڽ� Ŭ��
    $("#checkall").click(function(){
        //Ŭ���Ǿ�����
        if($("#checkall").prop("checked")){
            //input�±��� name�� chk�� �±׵��� ã�Ƽ� checked�ɼ��� true�� ����
            $("input[name=box]").prop("checked",true);
            //Ŭ���� �ȵ�������
        }else{
            //input�±��� name�� chk�� �±׵��� ã�Ƽ� checked�ɼ��� false�� ����
            $("input[name=box]").prop("checked",false);
        }
    })
})

function RequiredBox() {

		var hi =  $("input:checkbox[name='box']").is(":checked");
		
		if(!hi){
			alert("�ϳ��̻������ּ���");
			return false;
		}
}
	</script>