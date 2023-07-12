<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

</main>

<footer class="footer">
    <div class="container-fluid">
        <div class="row text-muted">
            <div class="col-6 text-left">
                <p class="mb-0">
                    <a href="#" class="text-muted"><strong>后台中心</strong></a> &copy;
                </p>
            </div>
        </div>
    </div>
</footer>
</div>
</div>
<script src="../js/vendor.js"></script>
<script src="../js/app.js"></script>

<script>

    $(function(){
       var userName = window.localStorage.USERNAME;
       if(!userName){
            //alert("请登录");
            //window.location.href="/login";
       }
       $(".adminUserNameValue").html(userName);
    });

</script>
</body>
</html>