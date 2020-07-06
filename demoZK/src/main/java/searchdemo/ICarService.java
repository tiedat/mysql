package searchdemo;

import java.util.List;

public interface ICarService {
    public List<Car> findAll();
    public List<Car> search(String keyword);
}
