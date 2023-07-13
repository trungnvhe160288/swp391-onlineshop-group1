
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.tailwindcss.com"></script>

<style>
    #select-box{
        overflow-y:auto;
    }
    option{
        overflow-y:scroll;
    }

    .hidden-description{
        overflow: hidden;
        text-overflow: ellipsis;
        line-height: 25px;
        -webkit-line-clamp: 3;
        height: 75px;
        display: -webkit-box;
        -webkit-box-orient: vertical;
    }
</style>

<div class="main-content">
    <section class="section">
        <div class="section-body">
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="card-header">
                            <h4>Product Image Adding</h4>
                        </div>
                        <div class="card-body ">
                            <form action="${pageContext.request.contextPath}/dashboard/image/add.ad" method="POST" enctype="multipart/form-data">
                                <div class="d-flex justify-content-center">
                                    <div class="col-4">
                                        <select name='pid'  class="form-control" id="select-box" onchange="viewProduct()">
                                            <c:forEach items="${products}" var="item" >
                                                <option  value="${item.id}">${item.name}</option>
                                            </c:forEach>
                                        </select>

                                        <div>
                                            <c:forEach items="${products}" var="item">
                                                <div class="card mt-4 d-none" id='selected_${item.id}' >
                                                    <img class="card-img-top" style='height: 240px' src="${pageContext.request.contextPath}${item.thumbnail_url}" alt="Card image cap">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Name: ${item.name}</h5>
                                                        <p class="card-text hidden-description">Descriotion: ${item.description}</p>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <h2 class="text-center mb-4">Product Image</h2>
                                        
                                        <div class="form-group col-12 ">
                                            <div class="">
                                                <div class="upload-container relative flex items-center justify-between w-full">
                                                    <div class="drop-area w-full rounded-md border-2 border-dotted border-gray-200 transition-all text-center">
                                                        <label for="file-input" class="block w-full h-full text-gray-500 p-4 text-sm cursor-pointer">Drop your image here or click to browse</label>
                                                        <input name="upload_image" type="file" id="file-input" accept="image/*" value="${pageContext.request.contextPath}${data.url}" class="hidden" required=""/>
                                                        <!-- Image upload input -->
                                                        <div class="preview-container items-center justify-center flex-col flex">
                                                            <div class="preview-image bg-cover bg-center rounded-md" style="width: 300px; height: 300px; background-image: url(${pageContext.request.contextPath}${data.url})"></div>
                                                            <span class="file-name my-4 text-sm font-medium"></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>  
                                        </div>
                                        <div class="form-group clearfix d-flex justify-content-center">
                                            <button onclick="this.form.submit()" class="btn btn-success ">Save Changes</button>
                                        </div>
                                    </div>
                                </div>

                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
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
    function viewProduct() {
        const item = document.getElementById('selected');

        if (item) {
            item.classList.add('d-none');
            item.id = '';
        }

        const id = document.getElementById('select-box').value;

        const selected = document.getElementById('selected_' + id);
        selected.classList.remove('d-none');
        selected.id = 'selected';
    }

</script>

