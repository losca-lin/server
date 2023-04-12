package self.cases.teams.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import self.cases.teams.entity.Form;
import self.cases.teams.entity.Users;
import self.cases.teams.handle.CacheHandle;
import self.cases.teams.service.UsersService;
import self.cases.teams.utils.DateUtils;
import self.cases.teams.utils.IDUtils;
import self.cases.teams.msg.R;
import self.cases.teams.msg.PageData;

import self.cases.teams.entity.Teams;
import self.cases.teams.service.TeamsService;

import java.util.List;

/**
 * 系统请求响应控制器
 * 球队信息
 */
@Controller
@RequestMapping("/teams")
public class TeamsController extends BaseController {

    protected static final Logger Log = LoggerFactory.getLogger(TeamsController.class);

    @Autowired
    private CacheHandle cacheHandle;

    @Autowired
    private UsersService usersService;

    @Autowired
    private TeamsService teamsService;


    @GetMapping("/count")
    @ResponseBody
    public R count(){
        List<Form> list = teamsService.count();
        return R.successData(list);
    }


    @RequestMapping("")
    public String index() {

        return "pages/Teams";
    }

    @GetMapping("/info")
    @ResponseBody
    public R getInfo(String id) {

        Log.info("查找指定球队信息，ID：{}", id);

        Teams teams = teamsService.getOne(id);

        return R.successData(teams);
    }

    @GetMapping("/all")
    @ResponseBody
    public R getAll(){

        Log.info("获取全部的球队小组");

        List<Teams> list = teamsService.getAll();

        return R.successData(list);
    }

    @GetMapping("/man")
    @ResponseBody
    public R getListByManId(String manId){

        Log.info("获取指定小组管理员相关的小组列表");

        List<Teams> list = teamsService.getListByManId(manId);

        return R.successData(list);
    }

    @GetMapping("/page")
    @ResponseBody
    public R getPageInfos(Long pageIndex, Long pageSize,
                         String token, Teams teams) {

        Users user = usersService.getOne(cacheHandle.getUserInfoCache(token));

        if(user.getType() == 1){

            teams.setManager(user.getId());
        }

        Log.info("分页查找球队信息，当前页码：{}，"
                        + "每页数据量：{}, 模糊查询，附加参数：{}", pageIndex,
                pageSize, teams);

        PageData page = teamsService.getPageInfo(pageIndex, pageSize, teams);

        return R.successData(page);
    }

    @PostMapping("/add")
    @ResponseBody
    public R addInfo(Teams teams) {

        teams.setId(IDUtils.makeIDByCurrent());
        teams.setCreateTime(DateUtils.getNowDate("yyyy-MM-dd"));

        Log.info("添加球队信息，传入参数：{}", teams);

        teamsService.add(teams);

        return R.success();
    }

    @PostMapping("/upd")
    @ResponseBody
    public R updInfo(Teams teams) {

        Log.info("修改球队信息，传入参数：{}", teams);

        teamsService.update(teams);

        return R.success();
    }

    @PostMapping("/del")
    @ResponseBody
    public R delInfo(String id) {

        Log.info("删除球队信息, ID:{}", id);

        Teams teams = teamsService.getOne(id);

        teamsService.delete(teams);

        return R.success();
    }

}