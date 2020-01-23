**Organizing Albums with Machine Learning**

### Individual Plots:

[Ambient](https://imgur.com/Fp7a6KR.jpg)  
[Animal Collective](https://imgur.com/2eoiIfm.jpg)  
[Beatles](https://imgur.com/z6nURqT.jpg)  
[Bjork](https://imgur.com/4nh4Fp4.jpg)  
[Bob Dylan](https://imgur.com/5xYKcW0.jpg)   
[David Bowie](https://imgur.com/f9GZI76.jpg)      
[Death Metal](https://imgur.com/NVKI6Fy.jpg)  
[Emo](https://imgur.com/T4dUE1D.jpg)  
[Kanye](https://imgur.com/ILYeE4v.jpg)   
[Leonard Cohen](https://imgur.com/hfnD8xn.jpg)  
[Pink Floyd](https://imgur.com/YuzZgAV.jpg)  
[Post Hardcore](https://imgur.com/KRtsmBn.jpg)  
[Post Rock](https://imgur.com/GygLKj4.jpg)  
[Radiohead](https://imgur.com/BjxXxpz.jpg)  
[Shoegaze](https://imgur.com/oktKlnL.jpg)  
[Swans](https://imgur.com/zonBSgL.jpg)  
[Weezer](https://imgur.com/GprEcSR.jpg)  

---

When discussing music it can sometimes be helpful to think in terms of subcategories, sorting artist's discographies into 'eras' and  genres into subgenres. Usually these subcategories are obvious and require no explanation. For example, people often seperate The Beatles' early albums from their later more psychedelic music.

I thought it would be interesting to take an empirical approach to this kind of categorization, and see how much it lines up with conventional wisdom.

---

**Methodology:**

 I downloaded the descriptor data for several albums from RateYourMusic.com and used a technique called [Principal Component Analysis](https://en.wikipedia.org/wiki/Principal_component_analysis) to reduce the data to 2 dimensions. In general, PCA works by combining features that are correlated, with the goal of creating new features that show us the most variation in the data.

So if albums that are described as 'calm' are also often described as 'mellow' but almost never described as 'noisy', PCA might combine these features into a new one where 'calm' and 'mellow' give positive scores and 'noisy' gives negative scores.

The six features listed on each axis are the ones that are the most "important" for that feature, or have the most effect on where points end up along the axis.

---
**Sources:**

Album data from Rateyourmusic.com  
