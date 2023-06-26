<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean class="DAL.DAO"  id="dao"/>
<jsp:useBean class="DAL.CategoryDAO"  id="cd"/>
<jsp:useBean class="Ultils.CommonForJSP" id="common"/>


<style>

    .wizard-content-left {
        background-blend-mode: darken;
        background-color: rgba(0, 0, 0, 0.45);
        background-image: url("https://i.ibb.co/X292hJF/form-wizard-bg-2.jpg");
        background-position: center center;
        background-size: cover;
        height: 100vh;
        padding: 30px;
    }
    .wizard-content-left h1 {
        color: #ffffff;
        font-size: 38px;
        font-weight: 600;
        padding: 12px 20px;
        text-align: center;
    }

    .form-wizard {
        color: #888888;
        padding: 30px;
    }
    .form-wizard .wizard-form-radio {
        display: inline-block;
        margin-left: 5px;
        position: relative;
    }
    .form-wizard .wizard-form-radio input[type="radio"] {
        -webkit-appearance: none;
        -moz-appearance: none;
        -ms-appearance: none;
        -o-appearance: none;
        appearance: none;
        background-color: #dddddd;
        height: 25px;
        width: 25px;
        display: inline-block;
        vertical-align: middle;
        border-radius: 50%;
        position: relative;
        cursor: pointer;
    }
    .form-wizard .wizard-form-radio input[type="radio"]:focus {
        outline: 0;
    }
    .form-wizard .wizard-form-radio input[type="radio"]:checked {
        background-color: #fb1647;
    }
    .form-wizard .wizard-form-radio input[type="radio"]:checked::before {
        content: "";
        position: absolute;
        width: 10px;
        height: 10px;
        display: inline-block;
        background-color: #ffffff;
        border-radius: 50%;
        left: 1px;
        right: 0;
        margin: 0 auto;
        top: 8px;
    }
    .form-wizard .wizard-form-radio input[type="radio"]:checked::after {
        content: "";
        display: inline-block;
        webkit-animation: click-radio-wave 0.65s;
        -moz-animation: click-radio-wave 0.65s;
        animation: click-radio-wave 0.65s;
        background: #000000;
        content: '';
        display: block;
        position: relative;
        z-index: 100;
        border-radius: 50%;
    }
    .form-wizard .wizard-form-radio input[type="radio"] ~ label {
        padding-left: 10px;
        cursor: pointer;
    }
    .form-wizard .form-wizard-header {
        text-align: center;
    }
    .form-wizard .form-wizard-next-btn, .form-wizard .form-wizard-previous-btn, .form-wizard .form-wizard-submit {
        background-color: #d65470;
        color: #ffffff;
        display: inline-block;
        min-width: 100px;
        min-width: 120px;
        padding: 10px;
        text-align: center;
    }
    .form-wizard .form-wizard-next-btn:hover, .form-wizard .form-wizard-next-btn:focus, .form-wizard .form-wizard-previous-btn:hover, .form-wizard .form-wizard-previous-btn:focus, .form-wizard .form-wizard-submit:hover, .form-wizard .form-wizard-submit:focus {
        color: #ffffff;
        opacity: 0.6;
        text-decoration: none;
    }
    .form-wizard .wizard-fieldset {
        display: none;
    }
    .form-wizard .wizard-fieldset.show {
        display: block;
    }
    .form-wizard .wizard-form-error {
        display: none;
        background-color: #d70b0b;
        position: absolute;
        left: 15px;
        right: 0;
        bottom: 0;
        height: 2px;
        width: 50%;
    }
    .form-wizard .form-wizard-previous-btn {
        background-color: #fb1647;
    }
    .form-wizard .form-control wizard-required {
        font-weight: 300;
        height: auto !important;
        padding: 15px;
        color: #888888;
        background-color: #f1f1f1;
        border: none;
    }
    .form-wizard .form-control wizard-required:focus {
        box-shadow: none;
    }
    .form-wizard .form-group {
        position: relative;
        margin: 25px 0;
    }
    .form-wizard .wizard-form-text-label {
        position: absolute;
        left: 10px;
        top: 16px;
        transition: 0.2s linear all;
    }
    .form-wizard .focus-input .wizard-form-text-label {
        color: #d65470;
        top: -18px;
        transition: 0.2s linear all;
        font-size: 12px;
    }
    .form-wizard .form-wizard-steps {
        margin: 30px 0;
    }
    .form-wizard .form-wizard-steps li {
        width: 25%;
        float: left;
        position: relative;
    }
    .form-wizard .form-wizard-steps li::after {
        background-color: #f3f3f3;
        content: "";
        height: 5px;
        left: 0;
        position: absolute;
        right: 0;
        top: 50%;
        transform: translateY(-50%);
        width: 100%;
        border-bottom: 1px solid #dddddd;
        border-top: 1px solid #dddddd;
    }
    .form-wizard .form-wizard-steps li span {
        background-color: #dddddd;
        border-radius: 50%;
        display: inline-block;
        height: 40px;
        line-height: 40px;
        position: relative;
        text-align: center;
        width: 40px;
        z-index: 1;
    }
    .form-wizard .form-wizard-steps li:last-child::after {
        width: 50%;
    }
    .form-wizard .form-wizard-steps li.active span, .form-wizard .form-wizard-steps li.activated span {
        background-color: #d65470;
        color: #ffffff;
    }
    .form-wizard .form-wizard-steps li.active::after, .form-wizard .form-wizard-steps li.activated::after {
        background-color: #d65470;
        left: 50%;
        width: 50%;
        border-color: #d65470;
    }
    .form-wizard .form-wizard-steps li.activated::after {
        width: 100%;
        border-color: #d65470;
    }
    .form-wizard .form-wizard-steps li:last-child::after {
        left: 0;
    }
    .form-wizard .wizard-password-eye {
        position: absolute;
        right: 32px;
        top: 50%;
        transform: translateY(-50%);
        cursor: pointer;
    }
    @keyframes click-radio-wave {
        0% {
            width: 25px;
            height: 25px;
            opacity: 0.35;
            position: relative;
        }
        100% {
            width: 60px;
            height: 60px;
            margin-left: -15px;
            margin-top: -15px;
            opacity: 0.0;
        }
    }
    @media screen and (max-width: 767px) {
        .wizard-content-left {
            height: auto;
        }
    }

    .drop-area.active {
        border-color: #2563eb;
    }

    .img-thumbs {
        background: #eee;
        border: 1px solid #ccc;
        border-radius: 0.25rem;
        margin: 1.5rem 0;
        padding: 0.75rem;
    }
    .img-thumbs-hidden {
        display: none;
    }

    .wrapper-thumb {
        position: relative;
        display:inline-block;
        margin: 1rem 0;
        justify-content: space-around;
    }

    .img-preview-thumb {
        background: #fff;
        border: 1px solid none;
        border-radius: 0.25rem;
        box-shadow: 0.125rem 0.125rem 0.0625rem rgba(0, 0, 0, 0.12);
        margin-right: 1rem;
        max-width: 140px;
        padding: 0.25rem;
    }

    .remove-btn{
        position:absolute;
        display:flex;
        justify-content:center;
        align-items:center;
        font-size:.7rem;
        top:-5px;
        right:10px;
        width:20px;
        height:20px;
        background:white;
        border-radius:10px;
        font-weight:bold;
        cursor:pointer;
    }

    .remove-btn:hover{
        box-shadow: 0px 0px 3px grey;
        transition:all .3s ease-in-out;
    }

</style>
<script src="https://cdn.tailwindcss.com"></script>

<div class="main-content">
    <section class="section">
        <div class="section-body">
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="card-header">
                            <h4>Product Add New</h4>
                        </div>
                        <div class="card-body">
                            <section class="wizard-section">
                                <div class="row no-gutters">

                                    <div class="col-lg-12">
                                        <div class="form-wizard">


                                            <div class="form-wizard-header">
                                                <p>Fill all form field to go next step</p>
                                                <ul class="list-unstyled form-wizard-steps clearfix">
                                                    <li class="active"><span>1</span></li>
                                                    <li><span>2</span></li>
                                                    <li><span>3</span></li>
                                                    <li><span>4</span></li>
                                                </ul>
                                            </div>
                                            <form action="${pageContext.request.contextPath}/dashboard/product/detail.ad" method="POST" role="form" id="form-upload"  enctype="multipart/form-data">

                                                <input type="hidden" name="id" value="${data.id}">
                                                <fieldset class="wizard-fieldset  d-block">
                                                    <h5>Product Information</h5>
                                                    <div class="form-group form-float">
                                                        <div class="form-line">
                                                            <label class="form-label">Product Name*</label>
                                                            <input type="text" class="form-control wizard-required" name="productName" value="${data.name}" placeholder="Enter Product Name..." >
                                                            <div class="wizard-form-error"></div>

                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="form-group col">
                                                            <div class="form-line">
                                                                <label class="form-label">Price*</label>
                                                                <input type="text" class="form-control wizard-required" id="price" name="price" value="${data.price}" placeholder="Enter Product Price..." >
                                                                <div class="wizard-form-error"></div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group col">
                                                            <div class="form-line">
                                                                <label class="form-label">Percent_Discount*</label>
                                                                <input type="text" class="form-control wizard-required" id="percent_discount" name="percent_discount" value="${data.percent_discount}" placeholder="Enter Percent Discount < 1" >
                                                                <div class="wizard-form-error"></div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group col">
                                                            <div class="form-line">
                                                                <label class="form-label">Quantity*</label>
                                                                <input type="text" class="form-control wizard-required" name="quantity" id="quantity" value="${data.quantity}" placeholder="Enter Product Quantity" >
                                                                <div class="wizard-form-error"></div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group col">
                                                            <label class="d-block">Active?</label>
                                                            <div class="form-check form-check-inline ">
                                                                <input class="form-check-input" type="radio" name="actived" id="inlineradio1" value="true" ${data.active ? 'checked' : ''}>
                                                                <label class="form-check-label" for="inlineradio1"><i data-feather="check" class="text-success"></i></label>
                                                            </div>
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="radio" name="actived" id="inlineradio2" value="false" ${!data.active ? 'checked' : ''}>
                                                                <label class="form-check-label" for="inlineradio2"><i data-feather="x" class="text-danger"></i></label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="form-group col">
                                                            <div class="form-line">
                                                                <label class="form-label">Description</label>
                                                                <textarea class="summernote" name="description">${data.description}</textarea>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group clearfix">
                                                        <a href="javascript:;" class="form-wizard-next-btn float-right">Next</a>
                                                    </div>
                                                </fieldset>	
                                                <fieldset class="wizard-fieldset">
                                                    <h5>More Information</h5>
                                                    <div class="form-group form-float row">
                                                        <div class="form-line  col-12 col-md-6">
                                                            <div class="form-group">
                                                                <label class="form-label">Color</label>
                                                                <div class="row gutters-xs">
                                                                    <c:set var="colors" value="${dao.allColor}"/>
                                                                    <c:set value="${common.getCheckedColor(data.color)}" var="checkedC"/>
                                                                    <c:forEach begin="${0}" end="${colors.size() - 1}" var="i">
                                                                        <c:set var="item" value="${colors.get(i)}"/>
                                                                        <div class="col-auto">
                                                                            <label class="colorinput">
                                                                                <input name="color" type="checkbox" value="${item.id}" class="colorinput-input" ${checkedC[i] ? 'checked' : ''}   >
                                                                                <span class="colorinput-color" style="background-color: ${item.bgr_hex}"></span>
                                                                            </label>
                                                                        </div>
                                                                    </c:forEach>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-line col-12 col-md-6">
                                                            <div class="form-group">
                                                                <label class="form-label">Size</label>
                                                                <div class="selectgroup selectgroup-pills">
                                                                    <c:set var="sizes" value="${dao.allSize}"/>
                                                                    <c:set value="${common.getCheckedSize(data.size)}" var="checkedS"/>
                                                                    <c:forEach begin="${0}" end="${sizes.size() - 1}" var="i">
                                                                        <c:set var="item" value="${sizes.get(i)}"/>
                                                                        <label class="selectgroup-item">
                                                                            <input type="checkbox" name="size" value="${item.id}" class="selectgroup-input" ${checkedS[i] ? 'checked' : ''}>
                                                                            <span class="selectgroup-button">${item.name}</span>
                                                                        </label>
                                                                    </c:forEach>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-line col">
                                                            <div class="form-group">
                                                                <label class="form-label">Category</label>
                                                                <div class="selectgroup w-100">
                                                                    <c:set var="categories" value="${cd.all}"/>
                                                                    <c:forEach begin="${0}" end="${categories.size() - 1}" var="i">
                                                                        <c:set var="item" value="${categories.get(i)}"/>
                                                                        <label class="selectgroup-item">
                                                                            <input type="radio" name="category" value="${item.id}" class="selectgroup-input-radio" ${item.id == data.category.id ? 'checked' : ''}>
                                                                            <span class="selectgroup-button">${item.name}</span>
                                                                        </label>
                                                                    </c:forEach>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group clearfix">
                                                        <a href="javascript:;" class="form-wizard-previous-btn float-left">Previous</a>
                                                        <a href="javascript:;" class="form-wizard-next-btn float-right">Next</a>
                                                    </div>
                                                </fieldset>	
                                                <fieldset class="wizard-fieldset">
                                                    <h5>Thumbnail Image</h5>
                                                    <div class="form-group col-12 ">
                                                        <div class="">
                                                            <div class="upload-container relative flex items-center justify-between w-full">
                                                                <div class="drop-area w-full rounded-md border-2 border-dotted border-gray-200 transition-all text-center">
                                                                    <label for="file-input" class="block w-full h-full text-gray-500 p-4 text-sm cursor-pointer">Drop your image here or click to browse</label>
                                                                    <input name="thumbnail_image" type="file" id="file-input" accept="image/*" value="${data.thumbnail_url}" class="hidden" />
                                                                    <!-- Image upload input -->
                                                                    <div class="preview-container items-center justify-center flex-col flex">
                                                                        <div class="preview-image bg-cover bg-center rounded-md" style="width: 300px; height: 300px; background-image: url(${pageContext.request.contextPath}${data.thumbnail_url})"></div>
                                                                        <span class="file-name my-4 text-sm font-medium d-none"></span>
                                                                        <p class="close-button cursor-pointer transition-all mb-4 rounded-md px-3 py-1 border text-xs text-red-500 border-red-500 mt-3">Delete</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>  
                                                    </div>
                                                    <div class="form-group clearfix">
                                                        <a href="javascript:;" class="form-wizard-previous-btn float-left">Previous</a>
                                                        <a href="javascript:;" class="form-wizard-next-btn float-right">Next</a>
                                                    </div>
                                                </fieldset>	
                                                <fieldset class="wizard-fieldset" >
                                                    <h5>Product Images</h5>
                                                    <div class="container my-5">
                                                        <div class="row">
                                                            <div class="col">
                                                                <div class="form-group mt-5 focus-input">
                                                                    <label for="">Choose Images</label>
                                                                    <input type="file" class="form-control" name="product_image"  value="" accept="image/'" multiple id="upload-img" />
                                                                </div>
                                                                <div class="img-thumbs " id="img-preview">
                                                                    <c:forEach items="${data.image}" var="item">
                                                                        <div class="wrapper-thumb">
                                                                            <img src="${pageContext.request.contextPath}${item.url}" class="img-preview-thumb">
                                                                            <span class="remove-btn">x</span>
                                                                        </div>
                                                                    </c:forEach>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group clearfix">
                                                        <a href="javascript:;" class="form-wizard-previous-btn float-left">Previous</a>
                                                        <button href="#!" onclick="document.form[0].submit()" class="form-wizard-submit float-right">Submit</button>
                                                    </div>
                                                </fieldset>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>


<script>
    // Get the necessary elements from the HTML document
    const dropArea = document.querySelector('.drop-area');
    const fileInput = document.querySelector('#file-input');
    const previewContainer = document.querySelector('.preview-container');
    const previewImage = document.querySelector('.preview-image');
    const closeButton = document.querySelector('.close-button');
    const fileName = document.querySelector('.file-name');

    // Add event listener to the drop area to handle when a file is being dragged over it
    dropArea.addEventListener('dragover', (event) => {
        event.preventDefault(); // Prevent default behavior of browser
        dropArea.classList.add('active'); // Add "active" class to the drop area
    });

    // Add event listener to the drop area to handle when a file is no longer being dragged over it
    dropArea.addEventListener('dragleave', () => {
        dropArea.classList.remove('active'); // Remove "active" class from the drop area
    });

    // Add event listener to the drop area to handle when a file is dropped onto it
    dropArea.addEventListener('drop', (event) => {
        event.preventDefault(); // Prevent default behavior of browser
        const file = event.dataTransfer.files[0]; // Get the file that was dropped
        showPreview(file); // Show a preview of the file
        showFileName(file); // Show the name of the file
    });

    // Add event listener to the file input element to handle when a file is selected
    fileInput.addEventListener('change', () => {
        const file = fileInput.files[0]; // Get the file that was selected
        console.log(file);
        showPreview(file); // Show a preview of the file
        showFileName(file); // Show the name of the file
    });

    // Add event listener to the close button to handle when it is clicked
    closeButton.addEventListener('click', (event) => {
        event.preventDefault(); // Prevent default behavior of button
        fileInput.value = ''; // Clear the file input value
        previewImage.style.backgroundImage = ''; // Clear the preview image
        fileName.textContent = ''; // Clear the file name
        previewImage.classList.add('hidden'); // Hide the preview image
        previewContainer.classList.add('hidden'); // Hide the preview container
        previewImage.classList.remove('flex'); // Remove "flex" class from preview image
    });

    // Function to show a preview of the file
    function showPreview(file) {
        const reader = new FileReader(); // Create a new FileReader object
        reader.readAsDataURL(file); // Read the file as a data URL
        reader.onload = () => { // When the file has been read
            previewImage.style.backgroundImage = 'url(' + reader.result + ')'; // Set the background image of the preview container to the data URL
            previewImage.classList.remove('hidden'); // Show the preview image
            dropArea.classList.remove('active'); // Remove "active" class from drop area
            previewContainer.classList.remove('hidden'); // Show the preview container
            previewContainer.classList.add('flex'); // Add "flex" class to preview container
        };
    }

    // Function to show the name of the file
    function showFileName(file) {
        fileName.textContent = file.name; // Set the text content of the file name element to the name of the file
        fileName.style.display = 'block'; // Show the file name element
    }
</script>

<script>
    var imgUpload = document.getElementById('upload-img')
            , imgPreview = document.getElementById('img-preview')
            , imgUploadForm = document.getElementById('form-upload')
            , totalFiles
            , previewTitle
            , previewTitleText
            , img;

    imgUpload.addEventListener('change', previewImgs, true);

    function previewImgs(event) {
        totalFiles = imgUpload.files.length;

        if (!!totalFiles) {
            imgPreview.classList.remove('img-thumbs-hidden');
        }

        for (var i = 0; i < totalFiles; i++) {
            wrapper = document.createElement('div');
            wrapper.classList.add('wrapper-thumb');
            removeBtn = document.createElement("span");
            nodeRemove = document.createTextNode('x');
            removeBtn.classList.add('remove-btn');
            removeBtn.appendChild(nodeRemove);
            img = document.createElement('img');
            img.src = URL.createObjectURL(event.target.files[i]);
            img.classList.add('img-preview-thumb');
            wrapper.appendChild(img);
            wrapper.appendChild(removeBtn);
            imgPreview.appendChild(wrapper);

            $('.remove-btn').click(function () {
                $(this).parent('.wrapper-thumb').remove();
            });
        }
    }

//    function loadImage(event) {
//        totalFiles = ${data.image.size() - 1};
//
//        if (!!totalFiles) {
//            imgPreview.classList.remove('img-thumbs-hidden');
//        }
//
//        for (var i = 0; i < totalFiles; i++) {
//            wrapper = document.createElement('div');
//            wrapper.classList.add('wrapper-thumb');
//            removeBtn = document.createElement("span");
//            nodeRemove = document.createTextNode('x');
//            removeBtn.classList.add('remove-btn');
//            removeBtn.appendChild(nodeRemove);
//            img = document.createElement('img');
//            img.src = `${pageContext.request.contextPath}${data.image.get(i).url}`;
//            img.classList.add('img-preview-thumb');
//            wrapper.appendChild(img);
//            wrapper.appendChild(removeBtn);
//            imgPreview.appendChild(wrapper);
//
//            $('.remove-btn').click(function () {
//                $(this).parent('.wrapper-thumb').remove();
//            });
//        }
//    }
//
//    document.addEventListener('load', loadImage, true);
</script>