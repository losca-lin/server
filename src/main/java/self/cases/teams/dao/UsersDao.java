package self.cases.teams.dao;

import org.springframework.stereotype.Repository;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import self.cases.teams.entity.Users;

/**
 * 数据层处理接口
 * 球队成员
 */
@Repository("usersDao")
public interface UsersDao extends BaseMapper<Users> {
	

}