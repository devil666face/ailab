# https://github.com/mattcurf/ollama-intel-gpu
# https://github.com/eleiton/ollama-intel-arc/blob/main/docker-compose.yml

FROM intelanalytics/ipex-llm-inference-cpp-xpu:latest

ENV PATH="/llm:${PATH}"

RUN init-ollama

ENTRYPOINT ["ollama"]
CMD ["serve"]
