**Individual Plots:**

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

Music fans love to categorize the music they listen to, sorting artists discographies into 'eras' and genres into subgenres. I though it would be interesting to plot out albums based on their descriptions and see if it aligned with conventional knowledge or if we could gain some new perspective!

---

**Methodology:**

 I downloaded the descriptions for several albums from RateYourMusic.com and used a technique called [Principal Component Analysis](https://en.wikipedia.org/wiki/Principal_component_analysis) to reduce the data to 2 dimensions for visualization. PCA works by combining features that are highly correlated, with the goal of creating new features that show us the most variation in the data.

So if albums that are described as 'calm' are also often described as 'mellow' but almost never described as 'noisy', PCA might combine these features into a new one where 'calm' and 'mellow' give positive scores and 'noisy' gives negative scores.

The six features listed on each axis are the ones that are the most important for that feature, they have the most effect on where points end up along the axis.

---
**Sources:**

Album data from Rateyourmusic.com  
