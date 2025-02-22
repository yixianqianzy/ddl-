function dbn = dbntrain(dbn, x, opts)
    n = numel(dbn.rbm);

    dbn.rbm{1} = rbmtrain(dbn.rbm{1}, x, opts); %训练第一个RBM的参数
    for i = 2 : n
        x = rbmup(dbn.rbm{i - 1}, x);  %计算第二个RBM的输入
        dbn.rbm{i} = rbmtrain(dbn.rbm{i}, x, opts); %训练第二层RBM的参数
    end

end
