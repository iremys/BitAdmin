package com.bitacademy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitacademy.vo.HIncCateVo;
import com.bitacademy.vo.HIncludeVo;

@Repository
public class HIncDao {

	@Autowired
    private SqlSession sqlSession;

    /*인크루드 카테고리리스트 가져오기*/
    public List<HIncCateVo> selectHIncCate(){
        return sqlSession.selectList("hIncude.selectHIncCate");
    }
    
    /*인크루드 데이타리스트 가져오기*/
    public List<HIncludeVo> selectHIncludeList(){
        return sqlSession.selectList("hIncude.selectHIncludeList");
    }
    
    /*인크루드 데이타 가져오기*/
    public HIncludeVo getHInclude(int hInclude_id){
        return sqlSession.selectOne("hIncude.selectHInclude", hInclude_id);
    }
    
    /*인크루드 데이타 저장하기*/
    public int updateHInclude(HIncludeVo hIncludeVo){
        return sqlSession.update("hIncude.updateHInclude", hIncludeVo);
    }
    
    
}
