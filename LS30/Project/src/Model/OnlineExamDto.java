package Model;

import java.io.Serializable;
import java.util.List;

public class OnlineExamDto implements Serializable {
    private Integer timuId;
    private String daan;

    public Integer getTimuId() {
        return timuId;
    }

    public void setTimuId(Integer timuId) {
        this.timuId = timuId;
    }

    public String getDaan() {
        return daan;
    }

    public void setDaan(String daans) {
        this.daan = daans;
    }
}