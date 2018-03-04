package cn.merryyou.editor.editor.web;

import cn.merryyou.editor.editor.domain.Editor;
import cn.merryyou.editor.editor.service.EditorService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

/**
 * Created on 2018/3/2 0002.
 *
 * @author zlf
 * @email i@merryyou.cn
 * @since 1.0
 */
@Controller
@RequestMapping("/editorWeb")
@Slf4j
public class EditorController {

    @Autowired
    private EditorService editorService;

    @PostMapping
    @ResponseBody
    public String saveEditor(Editor editor) {
        log.info(editor.toString());
        editorService.save(editor);
        return "success";
    }

    @GetMapping("/{id}")
    public ModelAndView preview(@PathVariable(value = "id")int id,Map map){

        Editor editor = editorService.findOne(id);

        map.put("editor",editor);
        return new ModelAndView("preview",map);
    }
}
