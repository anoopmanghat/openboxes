<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:layoutTitle default="OpenBoxes" /></title>
    <link rel="stylesheet" href="${createLinkTo(dir:'css/', file:'bundle.css')}">
</head>
<body class="d-flex flex-column">
    <div style="flex: 1">
        <g:layoutBody />
    </div>
    <div class="border-top align-self-end text-center py-2 w-100 footer">
        <g:render template="/common/footer" />
    </div>
</body>
</html>
