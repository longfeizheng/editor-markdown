<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8"/>
    <title>Editor.md examples</title>
    <link rel="stylesheet" href="${re.contextPath}/editor/css/style.css"/>
    <link rel="stylesheet" href="${re.contextPath}/editor/css/editormd.css"/>
    <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon"/>
</head>
<body>
<div id="layout">
    <div id="test-editormd">
                <textarea style="display:none;" id="textContent" name="textContent">
                    <#if editor.textContent=="">
[TOC]

#### Disabled options

- TeX (Based on KaTeX);
- Emoji;
- Task lists;
- HTML tags decode;
- Flowchart and Sequence Diagram;

#### Editor.md directory

    editor.md/
            lib/
            css/
            scss/
            tests/
            fonts/
            images/
            plugins/
            examples/
            languages/
            editormd.js
            ...

```html
&lt;!-- English --&gt;
&lt;script src="../dist/js/languages/en.js"&gt;&lt;/script&gt;

&lt;!-- 繁體中文 --&gt;
&lt;script src="../dist/js/languages/zh-tw.js"&gt;&lt;/script&gt;
```
<#else>
${editor.textContent!''}
</#if>


</textarea>
        <!-- 第二个隐藏文本域，用来构造生成的HTML代码，方便表单POST提交，这里的name可以任意取，后台接受时以这个name键为准 -->
        <textarea id="text" class="editormd-html-textarea" name="text"></textarea>
    </div>
</div>
<div>
    <button onclick="saveHtml()">保存</button>
</div>
<script src="${re.contextPath}/jquery.min.js"></script>
<script src="${re.contextPath}/editor/editormd.min.js"></script>
<script type="text/javascript">
    var testEditor;

    $(function () {
        testEditor = editormd("test-editormd", {
            width: "90%",
            height: 640,
            syncScrolling: "single",
            path: "${re.contextPath}/editor/lib/",
            imageUpload: true,
            imageFormats: ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL: "/file",
            //这个配置在simple.html中并没有，但是为了能够提交表单，使用这个配置可以让构造出来的HTML代码直接在第二个隐藏的textarea域中，方便post提交表单。
            saveHTMLToTextarea: true
            // previewTheme : "dark"
        });
    });

    function saveHtml() {
        // console.log($("#text").text());
        console.log($("#textContent").text());
        $.ajax({
            url: "${re.contextPath}/editorWeb",
            type: "post",
            async: true,
            data: {
                "content": $("#text").text(),
                "textContent": $("#textContent").text()
            },
            dataType: "json",
            success: function (data) {
            alert(data.msg);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
            alert(textStatus); // paser error;
            }
        });
    }
</script>
</body>
</html>