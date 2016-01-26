var req;
var isIE;
var completeField;
var completeTable;
var autoRow;

// Function #1: This is the first called funtion. 
function init() {
    //getting the values from the html input text we type. 
    completeField = document.getElementById("complete-field");
    completeTable = document.getElementById("complete-table");
    autoRow = document.getElementById("auto-row");
    //setting some CSS properties. 
    completeTable.style.top = getElementY(autoRow) + "px";
}

// Function #2: 
//This is the function which is called when a onKeyUp
function doCompletion() {

    // Setting the value of the text we type in the input field to the URL. 
    var url = "autocomplete?action=complete&id=" + escape(completeField.value);
    // Function creating an XMLHttpRequest. 
    req = initRequest();
    // Specifies the type of request and populates the variables to be computed. In this case it has already sent the request to the java servlet and the servlet has created an XML "" for the responseXML to work. 
    req.open("GET", url, true);
    // onreadystatechange stores the function every time the ready state changes. Every time the ready state changes it calls the function specified here. 
    req.onreadystatechange = callback;
    req.send(null);
}

// Function #2-1
function initRequest() {
    if (window.XMLHttpRequest) {
        if (navigator.userAgent.indexOf('MSIE') != -1) {
            isIE = true;
        }
        return new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        isIE = true;
        return new ActiveXObject("Microsoft.XMLHTTP");
    }
}

// Function #2-2
function callback() {
    // Each time the state changes it has to populate a new table. And start afresh. So we use the clear table function, to clear the previous table values. 
    clearTable();
    // Checking the status of the codes if everything was all-set. And the server (in our case the java servlet has delivered.)
    if (req.readyState == 4) {
        if (req.status == 200) {
            // req.responseXML works with the tags, getElementsByTagName("")....
            parseMessages(req.responseXML);
        }
    }
}

function appendProduct(productTitle,linkDetails,productId) {

    var row;
    var cell;
    var linkElement;
    
    if (isIE) {
        completeTable.style.display = 'block';
        row = completeTable.insertRow(completeTable.rows.length);
        cell = row.insertCell(0);
    } else {
        completeTable.style.display = 'table';
        row = document.createElement("tr");
        cell = document.createElement("td");
        row.appendChild(cell);
        completeTable.appendChild(row);
    }

    cell.className = "popupCell";

    linkElement = document.createElement("a");
    linkElement.className = "popupItem";
    linkElement.setAttribute("href", linkDetails);

    linkElement.appendChild(document.createTextNode(productTitle));
    cell.appendChild(linkElement);
}

function clearTable() {
    if (completeTable.getElementsByTagName("tr").length > 0) {
        completeTable.style.display = 'none';
        for (loop = completeTable.childNodes.length -1; loop >= 0 ; loop--) {
            completeTable.removeChild(completeTable.childNodes[loop]);
        }
    }
}

function getElementY(element){
    
    var targetTop = 0;
    
    if (element.offsetParent) {
        while (element.offsetParent) {
            targetTop += element.offsetTop;
            element = element.offsetParent;
        }
    } else if (element.y) {
        targetTop += element.y;
    }
    return targetTop;
}

function parseMessages(responseXML) {
    
    // no matches returned
    if (responseXML == null) {
        return false;
    } else {

        var products = responseXML.getElementsByTagName("products")[0];

        if (products.childNodes.length > 0) {
            completeTable.setAttribute("bordercolor", "black");
            completeTable.setAttribute("border", "1");
    
            for (loop = 0; loop < products.childNodes.length; loop++) {
                var product = products.childNodes[loop];
                var productTitle = product.getElementsByTagName("productTitle")[0];
                var linkDetails = product.getElementsByTagName("linkDetails")[0];
                var productId = product.getElementsByTagName("id")[0];
                appendProduct(productTitle.childNodes[0].nodeValue,
                    linkDetails.childNodes[0].nodeValue,
                    productId.childNodes[0].nodeValue);
            }
        }
    }
}