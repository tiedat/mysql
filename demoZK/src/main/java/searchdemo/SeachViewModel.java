package searchdemo;

import lombok.Getter;
import lombok.Setter;
import org.zkoss.bind.annotation.Command;
import org.zkoss.zul.ListModelList;

import java.util.List;

public class SeachViewModel {

    @Getter @Setter
    private String keyword;

    @Getter
    private List<Car> carList = new ListModelList<Car>();

    @Getter @Setter
    private Car selectedCar;

    private ICarService carService = new CarServiceImpl();

    @Command
    public void search(){
        carList.clear();
        carList.addAll(carService.search(keyword));
    }


}
