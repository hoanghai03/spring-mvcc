<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="userAPI" value="/api/user"/>
<c:url var="login" value="/dang-nhap"/>
<c:url var="register" value="/dang-ky"/>
<html>
<head>
    <title>Đăng ký</title>
</head>
<body>
<div class="container h-100">
    <div class="d-flex justify-content-center h-100">
        <div class="user_card">
            <div class="d-flex justify-content-center">
                <div class="brand_logo_container">
                    <img src="https://cdn.freebiesupply.com/logos/large/2x/pinterest-circle-logo-png-transparent.png" class="brand_logo" alt="Logo">
                </div>
        </div>
<%--             <c:if test="${param.incorrectAccount != null}">
                <div class="alert alert-danger" role="alert">
                        Sai mật khẩu, thằng ngu này
                </div>
            </c:if>
            <c:if test="${param.accessDenied != null}">
                <div class="alert alert-danger" role="alert">
                        mày tuổi vào đc
                </div>
            </c:if> --%>

            <div class="d-flex justify-content-center form_container">

                <form:form id="formSubmit" modelAttribute="model">
                    <div class="input-group mb-3">
                        <div class="input-group-append">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                        <form:input type="text" class="form-control input_user" placeholder="username"
                        id="userName" path="userName" />
                    </div>
                    <div class="input-group mb-2">
                        <div class="input-group-append">
                            <span class="input-group-text"><i class="fas fa-key"></i></span>
                        </div>
                        <form:input type="password" class="form-control input_pass" placeholder="password"
                        id="password" path="password" />
                    </div>
                    <div class="input-group mb-2">
                        <div class="input-group-append">
                            <span class="input-group-text"><i class="fas fa-key"></i></span>
                        </div>
                        <form:input type="text" class="form-control" placeholder="email"
                        id="email" path="email" />
                    </div>
                    <div class="input-group mb-2">
                        <div class="input-group-append">
                            <span class="input-group-text"><i class="fas fa-key"></i></span>
                        </div>
                        <form:input type="text" class="form-control" placeholder="fullname"
                        id="fullname" path="fullName" />
                    </div>
                    <div class="d-flex justify-content-center mt-3 login_container">
                        <button type="submit" id="login" name="button" class="btn login_btn">">sign up</button>
                    </div>

                </form:form>
            </div>
        </div>
    </div>
</div>

<script>
$('#login').click(function (e) {
    e.preventDefault();
    var data = {};
    var formData = $('#formSubmit').serializeArray();
    $.each(formData, function (i, v) {
        data[""+v.name+""] = v.value;
    });
	addUser(data);

});

function addUser(data) {
	$.ajax({
        url: '${userAPI}',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(data),
        dataType: 'json',
        success: function (result) {
        	window.location.href = "${login}";
        },
        error: function (error) {
        	window.location.href = "${register}";
        }
    });
}
</script>
</body>
</html>
