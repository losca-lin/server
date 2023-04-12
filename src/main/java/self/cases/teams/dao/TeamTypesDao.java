package self.cases.teams.dao;

import org.springframework.stereotype.Repository;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import self.cases.teams.entity.TeamTypes;

/**
 * 数据层处理接口
 * 球队职位
 */
@Repository("teamTypesDao")
public interface TeamTypesDao extends BaseMapper<TeamTypes> {
	

}