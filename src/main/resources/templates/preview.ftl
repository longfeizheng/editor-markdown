<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8"/>
    <title>Editor.md examples</title>
    <link rel="stylesheet" href="${re.contextPath}/editor/css/editormd.preview.min.css" />
    <link rel="stylesheet" href="${re.contextPath}/editor/css/editormd.css"/>
</head>
<body>
<!-- 因为我们使用了dark主题，所以在容器div上加上dark的主题类，实现我们自定义的代码样式 -->
<div class="content editormd-preview-theme" id="content">${editor.content!''}</div>
<script src="${re.contextPath}/jquery.min.js"></script>
<script src="${re.contextPath}/editor/lib/marked.min.js"></script>
<script src="${re.contextPath}/editor/lib/prettify.min.js"></script>
<script src="${re.contextPath}/editor/editormd.min.js"></script>
<script type="text/javascript">
    editormd.markdownToHTML("content");
</script>
</body>
</html>