
# Quartz 디지털 가든 프로젝트 설정 및 배포 매뉴얼

이 매뉴얼은 Quartz 프로젝트를 처음부터 Netlify에 배포하는 과정을 다룹니다. 각 단계는 필요한 설치 및 설정을 포함하고 있으며, 그대로 따라하면 됩니다.

## 1. 환경 설정

### 1.1 Node.js 및 Hugo 설치
- **Homebrew**를 사용하여 Hugo와 Node.js를 설치합니다.

  ```bash
  brew install hugo
  brew install node
  ```

### 1.2 Quartz 프로젝트 폴더 준비
- 디지털 가든 프로젝트를 저장할 폴더를 설정합니다.

  ```bash
  mkdir /Volumes/1TB/DigitalGarden
  cd /Volumes/1TB/DigitalGarden
  ```

---

## 2. Quartz 테마 설정

### 2.1 Quartz 테마 클론
- Quartz 테마를 프로젝트의 `themes` 폴더에 서브모듈로 추가합니다.

  ```bash
  mkdir -p themes
  git submodule add https://github.com/jackyzha0/quartz.git themes/quartz
  ```

### 2.2 `config.toml` 파일 설정
- `config.toml` 파일을 생성하여 Quartz 테마를 설정합니다. 파일의 내용은 다음과 같습니다.

  ```toml
  baseURL = "http://localhost:1313"
  languageCode = "en-us"
  title = "Digital Garden"
  theme = "quartz"
  ```

---

## 3. Quartz 빌드 및 테스트

### 3.1 Quartz 빌드 파일 설치
- 프로젝트의 종속성을 설치합니다.

  ```bash
  npm install
  ```

### 3.2 Quartz 빌드 및 테스트
- Quartz CLI를 사용해 빌드를 실행합니다.

  ```bash
  npx quartz build
  ```

- `Warning: you seem to be missing an index.md home page file`와 같은 경고가 표시될 경우, `content/index.md` 파일을 생성하여 홈 페이지 역할을 하도록 설정합니다.

  ```markdown
  # Welcome to My Digital Garden

  This is the main page of my digital garden.
  ```

- 빌드가 성공하면 `/public` 폴더가 생성됩니다.

---

## 4. Netlify를 통한 배포 설정

### 4.1 GitHub에 Quartz 프로젝트 업로드
- GitHub에 새 저장소를 생성하고 Quartz 프로젝트를 푸시합니다.

  ```bash
  git init
  git add .
  git commit -m "Initial commit with Quartz site"
  git remote add origin https://github.com/your-username/your-repository.git
  git push -u origin main
  ```

### 4.2 Netlify와 GitHub 연동 및 빌드 설정
1. Netlify에 로그인한 후, **Add new site > Import from Git**으로 GitHub와 연동합니다.
2. Quartz 프로젝트가 포함된 저장소를 선택합니다.
3. 빌드 설정을 다음과 같이 설정합니다:
   - **Build Command**: `npx quartz build`
   - **Publish Directory**: `public`

4. **Node.js 버전 설정** (Quartz는 Node.js 20 이상을 요구)
   - 프로젝트 폴더에 `.nvmrc` 파일을 생성하고, `20`을 입력하여 Netlify가 Node.js 20을 사용하도록 설정합니다.

     ```bash
     echo "20" > .nvmrc
     ```

   - 또는 `netlify.toml` 파일을 생성하여 Node.js 버전을 설정할 수 있습니다.

     ```toml
     [build.environment]
       NODE_VERSION = "20"
     ```

5. 변경 사항을 커밋하고 GitHub에 푸시하여 Netlify에서 자동으로 Node.js 버전이 설정되도록 합니다.

---

## 5. 배포 및 결과 확인

1. Netlify에서 **Deploy site** 버튼을 클릭하여 배포를 시작합니다.
2. 배포가 완료되면 Netlify가 제공하는 URL을 통해 사이트를 확인할 수 있습니다.

---

이제 Quartz 디지털 가든 사이트가 Netlify를 통해 온라인에서 접근 가능하게 배포되었습니다.
