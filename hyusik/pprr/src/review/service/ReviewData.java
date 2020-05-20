package review.service;

import java.util.List;

import review.dto.ReviewDto;

public class ReviewData {
	private List<ReviewDto> review;

	public ReviewData(List<ReviewDto> review) {
		this.review=review;
	}

	public List<ReviewDto> getReview() {
		return review;
	}
	
}
