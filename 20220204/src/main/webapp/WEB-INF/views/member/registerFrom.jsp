<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <div class="container">

      <div class="card o-hidden border-0 shadow-lg my-5">
         <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
               <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
               <div class="col-lg-7">
                  <div class="p-5">
                     <div class="text-center">
                        <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                     </div>
                     <form class="user" onsubmit="return checkForm()" action="register.do" method="post">
                        <div class="form-group row">
                           <div class="col-sm-6 mb-3 mb-sm-0">
                              <input type="text" class="form-control form-control-user"
                                 id="id" name="id" placeholder="Enter id...">
                           </div>
                           <div class="col-sm-6">
                              <button type="button" class="btn btn-primary btn-user btn-block" id="idKey" onclick="idCheck()" value="No">
                              ID중복체크</button>
                           </div>
                        </div>
                        <div class="form-group row">
                           <div class="col-sm-6 mb-3 mb-sm-0">
                              <input type="password" class="form-control form-control-user"
                                 id="password" name="password" placeholder="Password...">
                           </div>
                           <div class="col-sm-6">
                              <input type="password" class="form-control form-control-user"
                                 id="repeatPassword" placeholder="Repeat Password...">
                           </div>
                        </div>
                        <div class="form-group">
                           <input type="text" class="form-control form-control-user"
                              id="name" name="name" placeholder="Your Name..." required="required">
                        </div>
                        <div class="form-group">
                           <input type="text" class="form-control form-control-user"
                              id="address" name="address" placeholder="Your Address...">
                        </div>
                        <div class="form-group">
                           <input type="text" class="form-control form-control-user"
                              id="tel" name="tel" placeholder="Your Telephone Number...">
                        </div>
                        
                        <button type="submit" class="btn btn-primary btn-user btn-block">
                           Register Account </button>
                        <hr>
                        <a href="#" class="btn btn-google btn-user btn-block">
                           <i class="fab fa-google fa-fw"></i> Register with Google
                        </a> <a href="#"
                           class="btn btn-facebook btn-user btn-block"> <i
                           class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                        </a>
                     </form>
                     <hr>
                     <div class="text-center">
                        <a class="small" href="#">Forgot
                           Password?</a>
                     </div>
                     <div class="text-center">
                        <a class="small" href="loginForm.do">Already have an account?
                           Login!</a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>

   </div>
   <script type="text/javascript">
      //아이디 중복체크 함수
      function idCheck(){
         $.ajax({
            url: 'idCheck.do',   //호출할 url
            type: 'post',
            data: {id:$('#id').val()},   //매개변수:매개값(태그 안에 사용한 id 중 값이 id인 것을 매개값으로 설정)
            dataType: 'text',
            success: function(data){
               console.log(data);
               if(data == '0'){
                  alert($('#id').val() + '\n이미존재하는 아이디입니다.');
                  $('#id').val('');
                  $('#id').focus();   //커서위치 아이디 input으로
               } else{
                  alert($('#id').val() + '\n사용가능한 아이디입니다.');
                  $("#idKey").val("Yes");
               }
            }
         });
      }
      function  checkForm(){ //form validation
    	if($("#idKey").val() != "Yes"){
    		alert("아이디 중복체크해주세요");
    		return false;
    	}    
      if($("#password").val() != $("repeatPassword").val()){
    	  alert("패스워드가 일치하지 않습니다.");
    	  $("#password").val("");
    	  $("repeatPassword").val("");
    	  $("#password").focus;
    	  return false;
      }
      return true;
      }
   </script>
</body>
</html>