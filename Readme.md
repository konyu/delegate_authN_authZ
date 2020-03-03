
# Hostsの修正が必要
/etc/hostsに書きを追加

```
127.0.0.1	main.dev.local
127.0.0.1	sub.dev.local
```

主のRailsはデフォルトの3000ポートで起動しブラウザから下記のURLでアクセスする
http://main.dev.local:3000

従のRailsは3001番ポートで起動しブラウザから下記のURLでアクセスする
http://sub.dev.local:3001