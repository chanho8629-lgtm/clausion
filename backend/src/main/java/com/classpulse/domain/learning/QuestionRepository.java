package com.classpulse.domain.learning;

import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface QuestionRepository extends JpaRepository<Question, Long> {
    List<Question> findByCourseId(Long courseId);
    List<Question> findByCourseIdAndSkillId(Long courseId, Long skillId);
    List<Question> findByCourseIdAndApprovalStatus(Long courseId, String approvalStatus);
    List<Question> findByCourseIdAndSkillIdAndApprovalStatus(Long courseId, Long skillId, String approvalStatus);
    List<Question> findBySkillId(Long skillId);
}
