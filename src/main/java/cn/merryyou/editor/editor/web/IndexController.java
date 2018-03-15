package cn.merryyou.editor.editor.web;

import cn.merryyou.editor.editor.domain.Editor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
public class IndexController {

    @RequestMapping("/")
    public ModelAndView index(Map map) {
        ModelAndView mav = new ModelAndView();

        map.put("editor", new Editor());
        return new ModelAndView("index", map);
    }
}
