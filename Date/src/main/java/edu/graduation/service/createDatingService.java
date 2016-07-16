package edu.graduation.service;

import edu.graduation.bean.Dating;
import edu.graduation.bean.User;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Tony on 16/5/3.
 */
@Service
public interface createDatingService {
    void createDating(Dating date);
    Dating selectDateId(Dating date);
    List<Dating> show();
    List<Dating> showDateWithId(int id);
    List<User> UserDateList(int id);
    void deleteDate(int id);
    List<Dating> placeSearch(Dating dating);
    List<Dating> descriptionSearch(Dating dating);
    List<Dating> timeSearch(Dating dating);

    }
