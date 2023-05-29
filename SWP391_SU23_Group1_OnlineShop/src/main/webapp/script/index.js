function appendParameter(param, value) {
  var url = window.location.href; // Get the current URL
  var parameter = param + '=' + value; // Construct the parameter string

  // Check if the URL already has parameters
  if (url.indexOf('?') !== -1) {
    // URL already has parameters
    // Check if the parameter already exists in the URL
    if (url.indexOf(param + '=') !== -1) {
      // Parameter already exists, replace its value or remove it
      if (value !== null && value !== '') {
        url = url.replace(new RegExp(param + '=[^&]+'), parameter);
      } else {
        // Remove the parameter from the URL
        url = url.replace(new RegExp(param + '=[^&]*&?'), '');
        // Remove the trailing '?' or '&' if parameter was the last one
        url = url.replace(/[?&]$/, '');
      }
    } else {
      // Parameter doesn't exist, append with '&'
      if (value !== null && value !== '') {
        url += '&' + parameter;
      }
    }
  } else {
    // URL doesn't have parameters, append with '?'
    if (value !== null && value !== '') {
      url += '?' + parameter;
    }
  }

  // Redirect to the updated URL
  window.location.href = url;
}
