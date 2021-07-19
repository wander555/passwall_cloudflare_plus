#### 1.配置Vps
- 域名一个，托管到 CloudFlare 并解析域名到此台 VPS 
- 开启 CloudFlare 的 “小云朵”

#### 2.获取passwall的ID
![image](https://github.com/wander555/passwall_cloudflare_plus/blob/main/QQ%E6%88%AA%E5%9B%BE20210719152908.png)
![image](https://github.com/wander555/passwall_cloudflare_plus/blob/main/QQ%E6%88%AA%E5%9B%BE20210719153052.png)


#### 3.拉取CloudflareSpeedTest
 - [CloudflareSpeedTest](https://github.com/XIU2/CloudflareSpeedTest)

#### 4.设置定时任务
`0 18 * * * bash /root/cf_start.sh > /dev/null`
 
 
