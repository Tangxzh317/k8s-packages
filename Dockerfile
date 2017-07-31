FROM fedora:24
MAINTAINER Devan Goodwin <dgoodwin@redhat.com>

RUN dnf install -y rpm-build rpmdevtools createrepo && dnf clean all

RUN rpmdev-setuptree

USER root
ADD entry.sh /root/
RUN chmod a+x /root/entry.sh
COPY ./ /root/rpmbuild/SPECS
ENTRYPOINT ["/root/entry.sh"]
