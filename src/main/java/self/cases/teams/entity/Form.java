package self.cases.teams.entity;

public class Form {
    private String name;
    private Integer count;

    public Form() {
        this.name = name;
        this.count = count;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "Form{" +
                "name='" + name + '\'' +
                ", count=" + count +
                '}';
    }
}
