# Alpine 管理筆記

## 什麼是 Alpine Linux？

- 超輕量級 Linux 發行版，常用於 Docker、CI/CD、雲端服務及 IoT。
- 採用 musl libc 及 BusyBox，體積極小，啟動快、資源需求低。
- 預設啟用加強型安全性。
- 套件管理工具為 `apk`。

---

## apk 是什麼？

- **apk（Alpine Package Keeper）** 是 Alpine Linux 的套件管理工具。
- 功能類似 Debian 的 `apt` 或 Red Hat/CentOS 的 `yum`。
- 提供安裝、移除、升級、查詢、搜尋等套件管理功能。
- 套件庫更新與操作都很迅速。

---

## apk 常用指令

| 功能             | 指令範例                          | 說明                          |
| ---------------- | ---------------------------------- | ----------------------------- |
| 更新套件庫       | `apk update`                       | 下載並更新最新套件庫資訊      |
| 安裝套件         | `apk add <套件名稱>`               | 安裝新套件                    |
| 移除套件         | `apk del <套件名稱>`               | 移除已安裝套件                |
| 查詢已安裝套件   | `apk info`                         | 顯示所有已安裝的套件          |
| 查詢套件資訊     | `apk info <套件名稱>`              | 顯示指定套件的詳細資訊        |
| 搜尋可用套件     | `apk search <關鍵字>`              | 搜尋所有可安裝的套件          |
| 升級全部套件     | `apk upgrade`                      | 將所有已安裝套件升級至最新版  |
| 查看套件檔案列表 | `apk info -L <套件名稱>`           | 列出套件安裝的所有檔案        |
| 清除快取         | `apk cache clean`                  | 刪除已下載的套件快取（省空間）|

---

### 常用 apk 指令詳解

#### 1. 更新套件庫
```sh
apk update
```
#### 2. 安裝套件
```sh
apk add <套件名稱>
# 範例：安裝 curl
apk add curl
# 不啟用快取
apk add --no-cache curl
```
- `--no-cache` (常用)映像檔不會留下快取檔案，減少鏡像體積。
#### 3. 移除套件
```sh
apk del <套件名稱>
# 範例：移除 curl
apk del curl
```
#### 4. 查詢已安裝的套件
```sh
apk info
```
#### 5. 查詢套件資訊
```sh
apk info <套件名稱>
# 範例：查詢 curl
apk info curl
```
- 顯示指定套件的詳細資訊。
#### 6. 搜尋可用的套件
```sh
apk search <關鍵字>
# 範例：搜尋 nginx
apk search nginx
```
#### 7. 升級已安裝套件
```sh
apk upgrade
```
- 將所有已安裝套件升級到最新版。
#### 8. 查看套件安裝檔案列表
```sh
apk info -L <套件名稱>
# 範例：查詢 curl 安裝的檔案
apk info -L curl
```
- 列出指定套件安裝的所有檔案。

#### 9. 清除快取
```sh
apk cache clean
```
查詢 apk 快取佔用空間
```sh
du -sh /var/cache/apk
```
暴力清除(不建議)
```sh
rm -rf /var/cache/apk/*
```
