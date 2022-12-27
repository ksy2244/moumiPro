package com.moumi.app.admin.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.moumi.app.common.FileManager;
import com.moumi.app.common.dao.CommonDAO;

@Service("notice.noticeService")
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public void insertNotice(Notice dto, String pathname) throws Exception {
		try {
			long seq = dao.selectOne("notice.seq");
			dto.setNoticeNum(seq);
			
			dao.insertData("notice.insertNotice", dto);
			
			if(!dto.getSelectFile().isEmpty()) {
				for(MultipartFile mf : dto.getSelectFile()) {
					String imageFilename = fileManager.doFileUpload(mf, pathname);
					if(imageFilename == null) {
						continue;
					}
					imageFilename = mf.getOriginalFilename();
					
					dto.setImageFilename(imageFilename);
					
					dao.insertData("notice.insertFile", dto);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("notice.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Notice> listNotice(Map<String, Object> map) {
		List<Notice> list = null;
		
		try {
			list = dao.selectList("notice.listNotice", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Notice> listNoticeTop() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateHitCount(long noticeNum) throws Exception {
		try {
			dao.updateData("notice.updateHitCount", noticeNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public Notice readNotice(long noticeNum) {
		Notice dto = null;
		
		try {
			dto = dao.selectOne("notice.readNotice", noticeNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Notice preReadNotice(Map<String, Object> map) {
		Notice dto = null;
		
		try {
			dto = dao.selectOne("notice.preReadNotice", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Notice nextReadNotice(Map<String, Object> map) {
		Notice dto = null;
		
		try {
			dto = dao.selectOne("notice.nextReadNotice", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateNotice(Notice dto, String pathname) throws Exception {
		try {
			dao.updateData("notice.updateNotice", dto);
			
			if(!dto.getSelectFile().isEmpty()) {
				for(MultipartFile mf : dto.getSelectFile()) {
					String imageFilename = fileManager.doFileUpload(mf, pathname);
					if(imageFilename == null) {
						continue;
					}
					imageFilename = mf.getOriginalFilename();
					
					dto.setImageFilename(imageFilename);
					
					dao.insertData("notice.insertFile", dto);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteNotice(long noticeNum, String pathname) throws Exception {
		try {
			List<Notice> listFile = listFile(noticeNum);
			if(listFile != null) {
				for (Notice dto : listFile) {
					fileManager.doFileDelete(dto.getImageFilename(), pathname);
				}
			}
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("field", "noticeNum");
			map.put("noticeNum", noticeNum);
			deleteFile(map);
			
			dao.deleteData("notice.deleteNotice", noticeNum);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void insertFile(Notice dto) throws Exception {
		try {
			dao.insertData("notice.insertFile", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Notice> listFile(long noticeNum) {
		List<Notice> listFile = null;
		
		try {
			listFile = dao.selectList("notice.listFile", noticeNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listFile;
	}

	@Override
	public Notice readFile(long noticeFileNum) {
		Notice dto = null;
		
		try {
			dto = dao.selectOne("notice.readFile", noticeFileNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void deleteFile(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("notice.deleteFile", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
