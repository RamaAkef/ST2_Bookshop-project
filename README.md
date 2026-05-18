# Book Shop Project — Phase 2

## Group of 2
We used Docker Hub as our container registry.

---

## The Three Branches

We have three branches, each deploys differently to the same EC2 server.

**dev** — every push builds the app into a `.tar.gz` file, saves it in the `artifacts/` folder, then builds a Docker image from that file and deploys it. The artifact folder keeps every build, nothing gets overwritten.

**test** — every push rebuilds the app from scratch (not reusing the dev artifact), builds a fresh Docker image, pushes it to Docker Hub, then deploys it.

**prod** — no building at all. It just reads the `IMAGE_VERSION` variable from GitHub settings, pulls that image from Docker Hub, and deploys it. This way prod only ever runs something that was already tested.

---

## How All Three Run on the Same Server

We gave each branch its own compose project name and port so they don't conflict:

| Branch | Port | Compose project |

| dev | 8081 | dev |
| test | 8082 | test |
| prod | 8083 | prod |

Each one also has its own `.env` file on the server.

---

## How to Promote to Production

1. Go to GitHub → Settings → Variables
2. Change `IMAGE_VERSION` to the test image tag you want (e.g. `test-abc1234`)
3. Push to the prod branch — it will deploy that version automatically

---

## Live URLs

- dev: `http://ec2-16-171-182-103.eu-north-1.compute.amazonaws.com:8081`
- test: `http://ec2-16-171-182-103.eu-north-1.compute.amazonaws.com:8082`
- prod: `http://ec2-16-171-182-103.eu-north-1.compute.amazonaws.com:8083`