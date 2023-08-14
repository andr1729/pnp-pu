function Dst = resc01(Src)

val_min=min(Src(:));
val_max=max(Src(:));
Dst=(Src-val_min)/(val_max-val_min);

end
