<%-- 
    Document   : Blog_edit
    Created on : Oct 16, 2023, 9:19:48 PM
    Author     : pc minh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Blog</title>

        <!-- bootstrap5 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
                integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
                integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>

        <!--ckeditor5-->
        <script src="https://cdn.ckeditor.com/ckeditor5/40.0.0/classic/ckeditor.js"></script>

        <style>
            label{
                font: caption;
            }
            .my-form {
                border-radius: 10px;
                background-color: #fff;
                margin-top: 100px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            }
            .hidden {
                display: none;
            }
        </style>

    </head>
    <body>
        
        <!--header-->
        <jsp:include page="Part/header.jsp"></jsp:include>


            <!--sidebar-->
        <jsp:include page="Part/sidebar_vip.jsp"></jsp:include>
        
        
        
        <div class="container-fluid">
            <div class="row">
                <div class="col-min-vh-100 p-4">
                    <div class="container mt-5" style="padding-top: 100px">
                        <div class="my-form row">
                            <h2>Sửa Blog</h2>
                <!--            <form id="blogForm" action="blog_add?user_id=${user.getUser_id()}" method="post" enctype="multipart/form-data">-->
                            <form id="blogForm" action="blog_edit?bl_id=${blog.getBl_id()}" method="post" enctype="multipart/form-data">
                                
                                <!--title-->
                                <div class="mb-3">
                                    <label for="title" class="form-label">Tiêu đề của Blog</label>
                                    <input type="text" class="form-control" id="blogTitle" name="title" value="${blog.getBl_title()}" disabled="">
                                </div>
                                <!--image-->
                                <div class="mb-3">
                                    <label for="image" class="form-label">Hình ảnh của blog </label>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-group mb-3">
                                                <input type="file" class="form-control" id="file" name="file" accept="image/*" onchange="loadFile(event)" hidden="">
                                            </div>
                                            <img id="output" src="${blog.getBl_img()}" alt="" class="img-thumbnail mt-3" >
                                        </div>
                                    </div>
                                </div>
                                
                                <!--user_id from session -> hidden-->
                                <input type="text" value="${user.getUser_id()}" name="user_id" type="hidden" hidden>
                                <!--blog type-->
                                <div class="mb-3">
                                    <label for="blogType" class="form-label">Loại Blog</label>
                                    <input type="text" class="form-control" id="type" value="${blog.getBl_type_name()}" disabled="">
                                    <select class="form-select" id="blogType" name="blogType" hidden="">
                                        <c:forEach items="${listType}" var="type">
                                            <option value="${type.getBl_type_name()}">${type.getBl_type_name()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <!--blog tag-->
                                <div class="mb-3">
                                    <label for="tags" class="form-label">Chọn Tag</label>
                                    <input type="text" class="form-control" id="tag" value="${blog.getBl_tag_tagname()}" disabled="">
                                    <select class="form-select" id="blogTag" name="blogTag" hidden="">
                                        <c:forEach items="${listTag}" var="tag">
                                            <option value="${tag.getBl_tag_tagname()}">${tag.getBl_tag_tagname()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                
                                    <div class="mb-3">
                                        <label for="blogContent" class="form-label">Nội dung bài viết</label>
                                        
                                        <!-- CKEditor container -->
                                        <textarea name="editor" id="editor" disabled="">
                                            ${blog.getBl_content()}
                                        </textarea>
                                    </div>
                                        
                                <!--creationdate-->
                                <div class="mb-3">
                                    <label for="creationDate">Ngày tạo</label>
                                    <input type="text" id="date" value="${blog.getBl_creationdate()}" disabled=""> 
                                    <input type="text" class="" name="creationdate" id="creation-date" readonly hidden>
                                </div>
                                <!--status-->
                                <div class="mb-3">
                                    <label class="form-label">Trạng thái Blog</label>
                                    <input type="text" id="status" value="${blog.getBl_status()}" disabled="">
                                    <div class="form-check" hidden="" id="blogStatus">
                                        <input class="form-check-input" type="radio" id="active" name="status" value="Active">
                                        <label class="form-check-label" for="active">
                                            Có hiệu lực
                                        </label>
                                    </div>
                                    <div class="form-check" hidden="" id="blogStatus1">
                                        <input class="form-check-input" type="radio" id="disable" name="status" value="Disable">
                                        <label class="form-check-label" for="disable">
                                            Vô hiệu hóa
                                        </label>
                                    </div>
                                </div>
                                <!-- Submit Button -->
                                <button class="btn btn-primary" type="button" id="editButton">Sửa bài viết</button>
                                <input class="btn btn-primary" onclick="createCourse()" type="submit" id="saveButton" value="Lưu" hidden>
                                <a type="button" href="blog_list" class="btn btn-secondary mybtn">
                                    Trở lại
                                </a>
                            </form>
                            
                        </div>
                    </div>
                    
                </div>
                
            </div>
            
        </div>


        <script>
            ClassicEditor
                    .create(document.querySelector('#editor') )
                    .then(newEditor => {
                        editor = newEditor;
                    })
                    .catch(error => {
                        console.error(error);
                    });
                    
        </script>
        
        <script>
            document.getElementById('editButton').addEventListener('click', function() {
                document.getElementById('blogTitle').disabled = false;
                document.getElementById('file').hidden = false;
                document.getElementById('type').hidden = true;
                document.getElementById('blogType').hidden = false;
                document.getElementById('tag').hidden = true;
                document.getElementById('blogTag').hidden = false;
                document.getElementById('editor').disabled = false;
                document.getElementById('date').hidden = true;
                document.getElementById('creation-date').hidden = false;
                document.getElementById('status').hidden = true;
                document.getElementById('blogStatus').hidden = false;document.getElementById('blogStatus1').hidden = false;
                document.getElementById('saveButton').hidden = false;
                this.hidden = true;
            });
            /*
            document.getElementById('saveButton').addEventListener('click', function() {
                document.getElementById('blogTitle').disabled = true;
                document.getElementById('file').hidden = true;
                document.getElementById('type').hidden = false;
                document.getElementById('blogType').hidden = true;
                document.getElementById('tag').hidden = false;
                document.getElementById('blogTag').hidden = true;
                document.getElementById('editor').disabled = true;
                document.getElementById('date').hidden = false;
                document.getElementById('creation-date').hidden = true;
                document.getElementById('status').hidden = false;
                document.getElementById('blogStatus').hidden = true;document.getElementById('blogStatus1').hidden = true;
                document.getElementById('editButton').hidden = false;
                this.hidden = true;
            });*/
        </script>
        
        <script>
            //truyen data from ckeditor box
            var createCourse = () => {
                var editor = $("#editor").val();
                $.ajax({
                    url: "blog_edit",
                    type: "post", //send it through get method
                    data: {
                        editor: editor,
                        dataType: "text", // The expected data type is text
                    },
                    success: function (data) {
                        $("#messageFromServlet").text(data);
                    },
                    error: function (xhr, status, error) {
                        //Do Something to handle error
                        console.log("AJAX Error: " + error);
                    }
                });
            };

            // Get the current date
            var currentDate = new Date();

            // Extract day, month, and year components
            var day = currentDate.getDate();
            var month = currentDate.getMonth() + 1; // Note: Month is zero-based, so add 1.
            var year = currentDate.getFullYear();
            // Ensure leading zeros for day and month if necessary
            day = (day < 10) ? '0' + day : day;
            month = (month < 10) ? '0' + month : month;
            // Format the date as "dd-mm-yyyy"
            var formattedDate = day + '-' + month + '-' + year;
            // Set the formatted date as the input value
            document.getElementById('creation-date').value = formattedDate;

            //preview image
            var loadFile = function (event) {
                var output = document.getElementById('output');
                output.src = URL.createObjectURL(event.target.files[0]);
                output.onload = function () {
                    URL.revokeObjectURL(output.src); // free memory
                };
            };
        </script>

    </body>
</html>
