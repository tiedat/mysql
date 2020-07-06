package searchdemo;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Car {
    private Integer id;
    private String model;
    private String make;
    private String description;
    private String preview;
    private Integer price;

}
