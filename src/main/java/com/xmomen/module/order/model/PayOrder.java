package com.xmomen.module.order.model;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * Created by Jeng on 2016/5/18.
 */
public @Data
class PayOrder implements Serializable {

    private String orderNo;
    private BigDecimal amount;

}
