package self.cases.teams.service;

import self.cases.teams.msg.PageData;

import self.cases.teams.entity.ApplyLogs;

/**
 * 业务层处理
 * 申请记录
 */
public interface ApplyLogsService extends BaseService<ApplyLogs, String> {

	/**
	 * 检查用户是否可以提交申请
	 * @param userId 用户ID
	 * @param teamId 小组ID
	 * @return
	 */
	public Boolean isApply(String userId, String teamId);

	/**
	 * 小组管理员分页查询申请记录信息
	 * @param pageIndex 当前页码
	 * @param pageSize 每页数据量
	 * @param userId 用户编号
	 * @param teamName 小组名称
	 * @param userName 用户姓名
	 * @return
	 */
	public PageData getManPageInfo(Long pageIndex, Long pageSize, String userId, String teamName, String userName);

	/**
	 * 分页查询申请记录信息
	 * @param pageIndex 当前页码
	 * @param pageSize 每页数据量
	 * @param userId 用户编号
	 * @param teamName 小组名称
	 * @param userName 用户姓名
	 * @return
	 */
	public PageData getPageInfo(Long pageIndex, Long pageSize, String userId, String teamName, String userName);
}