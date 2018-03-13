<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html lang="zh">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>物业管理平台</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta name="application-name" content="物业管理平台">
  <link href="resources/easyui/login/icons.css" rel="stylesheet">
  <link href="resources/easyui/login/bootstrap.css" rel="stylesheet">
  <link href="resources/easyui/login/plugins.css" rel="stylesheet">
  <link href="resources/easyui/login/login.css" rel="stylesheet">
  <%--<link rel="icon" href="http://zywy.77pay.com.cn/public/lib/home/img/ico/favicon.ico" type="image/png">--%>
  <meta name="msapplication-TileColor" content="#3399cc">
  <link rel="stylesheet" href="resources/easyui/login/layer.css" id="layui_layer_skinlayercss" style="">
</head>
<body>

<style>
  html,body{height: 100%;}
</style>
<!-- Start #login -->
<div class="title">
  <img class="title_logo" src="resources/easyui/login/xinhuilogo1.jpg" style="width:82.3px;height: 59.9px">
</div>

<div class="login-page" style="width:100%;background: url(resources/easyui/login/login-bg.jpg) center center no-repeat; ">
  <div id="login" class="animated bounceIn">
    <div class="login-wrapper" >
      <h4 style="color:#000000;font-size: 28px;text-align: center;margin:40px auto 20px auto">幸会·物业</h4>
      <div id="myTabContent" class="tab-content bn">
        <div class="tab-pane fade active in" id="log-in">
          <input type="hidden" value="${randomKey }" id="j_randomKey" />
          <form class="form-horizontal mt10" action="login" id="login_form" method="post">
            <div style="color:red;margin: auto auto; margin-bottom: 5px; text-align: center;">${error.message}</div>
            <input type="hidden" name="token" value="${token}" />
            <div class="form-group" style="height: 48px;width:300px;margin: 0px auto">
              <div class="col-lg-12m">
                <input type="text" id="j_username" value="" name="username" onblur="getLoginName()" class="form-controls" placeholder="手机号／登录账号" >
              </div>
            </div>
            <div class="form-group" style="height: 48px;width:300px;margin: 0px auto">
              <div class="col-lg-12">
                <input type="password" id="j_password" value="" name="password" type="password" class="form-controls" placeholder="请输入密码">
                <%--<span class="help-block"><a href="http://zywy.77pay.com.cn/login#"><small></small></a></span>--%>
              </div>
            </div>
            <div class="form-group" style="height: 48px;width:300px;margin: 0px auto">
              <div class="col-lg-12" style="position: relative">
                <input type="text" id="j_captcha" value="" name="captcha" type="password" class="form-controls" placeholder="请输入验证码">
                <img id="captcha_img" alt="点击更换" title="点击更换" src="${pageContext.request.contextPath}/image/captcha-image" class="m">
              </div>
            </div>
            <%--<div class="form-group">--%>
              <%--<label for="j_captcha" class="t">验证码：</label> <input id="j_captcha" name="captcha" type="text" class="form-control x164 in">--%>
              <%--<img id="captcha_img" alt="点击更换" title="点击更换" src="${pageContext.request.contextPath}/image/captcha-image" class="m">--%>
            <%--</div>--%>
            <style>


            </style>

            <div class="form-group" style="height: 18px;width:300px;margin: 10px auto 26px">
              <div class="col-lg-6 col-md-6 col-sm-6 col-xs-8">
                <div class="remberPassword" style="position:  relative;">
                  <input name="roleStatus" type="checkbox"  name="remember" id="j_remember" value="true"/>
                  <label for="j_remember" style="position: absolute; top: 2px;">记住密码</label>
                </div>
                <%--<label for="j_remember" class="m"><input id="j_remember" name="remember" type="checkbox" value="true">&nbsp;记住登陆账号!</label>--%>
                <%--<label class="checkbox" style="font-size: 13px">--%>
                  <%--<div class="icheckbox_flat-green" style="position: relative;">--%>
                    <%--<input type="checkbox" name="remember" id="remember" value="option" style="position: absolute; opacity: 0;">--%>
                    <%--<ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: #ff0000; border: 0px; opacity: 0;"></ins>--%>
                  <%--</div>记住密码--%>
                <%--</label>--%>
              </div>
            </div>
            <div class="form-group">
              <div class="login_btn">
                <button id="login_btn" type="submit">登录</button>
              </div>
            </div>
            <%--<div class="forget">--%>
              <%--<a id="forgetpwd" href="email/send" title="点击找回密码"><label class="t">忘记密码？</label></a>--%>
            <%--</div>--%>

          </form>
        </div>
      </div>
    </div>
  </div>

</div>
<div class="bottom">Copyright © 2017 上海申鑫电子支付股份有限公司 | ICP证: 沪ICP备16048892号</div>
<script src="resources/easyui/login/jquery-2.1.1.min.js"></script>
<script src="resources/BJUI/js/jquery.cookie.js"></script>
<script type="text/javascript">
    var COOKIE_NAME = 'sys__username';
    $(function() {
        //choose_bg();
        //changeCode();
        console.log("height:",$('body').height())

        $('.login-page').height($('body').height()-150)

        if ($.cookie(COOKIE_NAME)){
            $("#j_username").val($.cookie(COOKIE_NAME));
            $("#j_password").focus();
            $("#j_remember").attr('checked', true);
        } else {
            $("#j_username").focus();
        }
        $("#captcha_img").click(function(){
            changeCode();
        });
        $("#login_form").submit(function(){
            var issubmit = true;
            var i_index  = 0;
            $(this).find('.in').each(function(i){
                if ($.trim($(this).val()).length == 0) {
                    $(this).css('border', '1px #ff0000 solid');
                    issubmit = false;
                    if (i_index == 0)
                        i_index  = i;
                }
            });
            if (!issubmit) {
                $(this).find('.in').eq(i_index).focus();
                return false;
            }
            var $remember = $("#j_remember");
            if ($remember.attr('checked')) {
                $.cookie(COOKIE_NAME, $("#j_username").val(), { path: '/', expires: 15 });
            } else {
                $.cookie(COOKIE_NAME, null, { path: '/' });  //删除cookie
            }
            $("#login_ok").attr("disabled", true).val('登陆中..');

            return true;
        });
    });
    function genTimestamp(){
        var time = new Date();
        return time.getTime();
    }
    function changeCode(){
        $("#captcha_img").attr("src", "image/captcha-image?t="+genTimestamp());
    }
    function choose_bg() {
        var bg = Math.floor(Math.random() * 9 + 1);
        $('body').css('background-image', 'url(resources/image/loginbg_0'+ bg +'.jpg)');
    }


    function getLoginName() {
        var loginName = $("#j_username").val();
        var hrefs = "${pageContext.request.contextPath}/email/send?loginName="+loginName;
        $("#findPwd").attr("href",hrefs);
    }

</script>

<%--<script src="resources/easyui/login/pace.min.js"></script>--%>
<%--<script src="easyui/login/bootstrap.js"></script>--%>
<script src="resources/easyui/login/jquery.icheck.js"></script>
<script src="resources/easyui/login/jquery.validate.js"></script>
<script src="resources/easyui/login/additional-methods.min.js"></script>
<script src="resources/easyui/login/login.js"></script>
<script type="text/javascript" src="resources/easyui/login/layer.js"></script>

</body>
</html>
